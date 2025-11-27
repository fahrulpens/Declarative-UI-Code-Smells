package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-08 – INEFFICIENT LIST
 *
 * Builds thousands of rows inside a Column (eager),
 * instead of using LazyColumn. This kills performance for large data.
 */

@Composable
fun InefficientListExample() {
    val items = (0 until 5000).map { "Item $it" }

    Scaffold(
        topBar = { TopAppBar(title = { Text("Inefficient List Example") }) }
    ) { padding ->
        // All children are created upfront in a Column; if wrapped in a Scrollable
        // container, this becomes a large, heavy layout.
        Column(
            modifier = Modifier
                .padding(padding)
                .padding(8.dp)
        ) {
            items.forEach { item ->
                ListItem(headlineContent = { Text(item) })
                Divider()
            }
        }
    }
}
