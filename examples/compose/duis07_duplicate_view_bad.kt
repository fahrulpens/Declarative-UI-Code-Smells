package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-07 – DUPLICATE VIEW
 *
 * Three user "cards" with the same layout are copy–pasted
 * instead of extracting a reusable composable.
 */

@Composable
fun DuplicateViewExample() {
    Scaffold(
        topBar = { TopAppBar(title = { Text("Duplicate View Example") }) }
    ) { padding ->
        Column(
            modifier = Modifier
                .padding(padding)
                .padding(16.dp)
        ) {
            // Card #1
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 8.dp)
            ) {
                Column(Modifier.padding(8.dp)) {
                    Text("Alice", style = MaterialTheme.typography.titleMedium)
                    Text("alice@example.com")
                }
            }

            // Card #2 – copy-pasted layout
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 8.dp)
            ) {
                Column(Modifier.padding(8.dp)) {
                    Text("Bob", style = MaterialTheme.typography.titleMedium)
                    Text("bob@example.com")
                }
            }

            // Card #3 – again copy-pasted
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 8.dp)
            ) {
                Column(Modifier.padding(8.dp)) {
                    Text("Charlie", style = MaterialTheme.typography.titleMedium)
                    Text("charlie@example.com")
                }
            }
        }
    }
}
