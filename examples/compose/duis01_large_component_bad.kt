package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-01 – LARGE COMPONENT
 *
 * One composable (LargeComponentDashboard) is responsible for:
 *  - layout
 *  - navigation (tabs)
 *  - data loading
 *  - filtering
 *  - simple statistics
 *  - all UI rendering
 *
 * This is a "God component" / large component smell.
 */
@Composable
fun LargeComponentDashboard() {
    var tab by remember { mutableStateOf("home") }
    var name by remember { mutableStateOf("") }
    var items by remember { mutableStateOf(listOf<Int>()) }
    var filter by remember { mutableStateOf("") }
    var loading by remember { mutableStateOf(false) }
    var error by remember { mutableStateOf<String?>(null) }

    LaunchedEffect(Unit) {
        loading = true
        error = null
        try {
            kotlinx.coroutines.delay(500) // fake API call
            items = (0 until 50).toList()
        } catch (e: Exception) {
            error = "Failed to load items"
        } finally {
            loading = false
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(text = "Dashboard – $name") }
            )
        }
    ) { padding ->
        Row(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Sidebar/navigation + user info
            Column(
                modifier = Modifier
                    .width(220.dp)
                    .padding(16.dp)
            ) {
                Text(text = "User: ${if (name.isBlank()) "(anonymous)" else name}")
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Name") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(Modifier.height(16.dp))
                Text(text = "Tabs:")
                Row {
                    TextButton(onClick = { tab = "home" }) { Text("Home") }
                    TextButton(onClick = { tab = "stats" }) { Text("Stats") }
                    TextButton(onClick = { tab = "settings" }) { Text("Settings") }
                }
            }

            // Main content – all in this one huge composable
            Column(
                modifier = Modifier
                    .weight(1f)
                    .padding(16.dp)
            ) {
                when (tab) {
                    "home" -> {
                        OutlinedTextField(
                            value = filter,
                            onValueChange = { filter = it },
                            label = { Text("Filter") },
                            modifier = Modifier.fillMaxWidth()
                        )
                        Spacer(Modifier.height(8.dp))

                        when {
                            loading -> {
                                CircularProgressIndicator()
                            }

                            error != null -> {
                                Text(text = error!!, color = MaterialTheme.colorScheme.error)
                            }

                            else -> {
                                val filtered = items.filter {
                                    it.toString().contains(filter)
                                }
                                LazyColumn {
                                    items(filtered) { i ->
                                        Text(text = "Item $i", modifier = Modifier.padding(4.dp))
                                    }
                                }
                            }
                        }
                    }

                    "stats" -> {
                        val total = items.sum()
                        val count = items.size
                        Text(text = "Number of items: $count")
                        Text(text = "Sum of items: $total")
                    }

                    "settings" -> {
                        Text("Settings (many fields could go here...)")
                    }
                }
            }
        }
    }
}
