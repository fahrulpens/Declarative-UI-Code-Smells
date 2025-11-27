package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-03 – MUTABLE VIEW
 *
 * 1) The composable receives a MutableList<Int> from outside and
 *    directly mutates it (add/remove) instead of delegating to a ViewModel
 *    or callback → view is mutating external/shared state.
 *
 * 2) It also updates internal state inside composition in a way that
 *    strongly couples "render" with state mutation (not as obvious here
 *    as setState-in-render in React, but still smelly).
 */

// Imagine this is called from a parent that owns `items` as a mutable list.
@Composable
fun MutableViewExample(items: MutableList<Int>) {
    var initialized by remember { mutableStateOf(false) }
    var statusMessage by remember { mutableStateOf("Not initialized") }

    // ❌ Using items.size inside composition to "initialize" a status
    // is fine, but if we needed to update state based on that, we
    // could do it in LaunchedEffect – here we keep it simple but smelly.
    if (!initialized && items.size >= 3) {
        initialized = true
        statusMessage = "Initialized in composition when items.size >= 3"
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Mutable View Example") },
                actions = {
                    Text(
                        text = statusMessage,
                        modifier = Modifier.padding(end = 8.dp),
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            Row(modifier = Modifier.padding(8.dp)) {
                Button(onClick = {
                    // ❌ Smell: directly mutating the external list
                    items.add(items.size)
                }) {
                    Text("Add item")
                }
                Spacer(Modifier.width(8.dp))
                Button(onClick = {
                    if (items.isNotEmpty()) {
                        // ❌ Smell: again mutating shared state
                        items.removeLast()
                    }
                }) {
                    Text("Remove last")
                }
            }

            Divider()

            LazyColumn {
                items(items) { item ->
                    ListItem(
                        headlineContent = { Text("Item $item") }
                    )
                }
            }
        }
    }
}
