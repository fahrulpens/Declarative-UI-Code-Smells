package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-02 – NESTED VIEW
 *
 * Deeply nested Boxes/Rows/Columns just to show a simple text.
 */
@Composable
fun NestedViewExample() {
    Scaffold { padding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            Box(modifier = Modifier.padding(8.dp)) {
                Column {
                    Row {
                        Box {
                            Column {
                                Row {
                                    Box {
                                        Column {
                                            Text(
                                                text = "Deeply nested composable tree",
                                                modifier = Modifier.padding(8.dp)
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
