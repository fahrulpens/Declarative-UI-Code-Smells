package examples.compose

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable

/**
 * DUIS-04 – BLOCKING VIEW
 *
 * Heavy synchronous work is done directly in composition
 * (without remember or moving it to a ViewModel), so recomposition
 * re-runs expensive logic.
 */

private fun heavyComputation(): List<Int> {
    val result = mutableListOf<Int>()
    for (i in 0 until 100_000) {
        result.add(i * i)
    }
    return result
}

@Composable
fun BlockingViewExample() {
    // ❌ heavyComputation() will run every time this composable recomposes
    val squares = heavyComputation()

    Scaffold(
        topBar = { TopAppBar(title = { Text("Blocking View Example") }) }
    ) { padding ->
        LazyColumn(contentPadding = padding) {
            items(squares.take(200)) { n ->
                ListItem(headlineContent = { Text("Value: $n") })
            }
        }
    }
}
