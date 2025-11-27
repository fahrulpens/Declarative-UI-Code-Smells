package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-09 – MISUSED EFFECTS
 *
 * 1) LaunchedEffect without a proper key (Unit) doing work on every recomposition.
 * 2) Using side-effect to recompute a derived value that could be computed inline.
 */

@Composable
fun MisusedEffectsExample() {
    var value by remember { mutableStateOf(0) }
    var double by remember { mutableStateOf(0) }

    // ❌ Effect runs whenever this composable recomposes (key = Unit),
    // and sets a derived value that could be computed directly in UI.
    LaunchedEffect(Unit) {
        double = value * 2
        println("Effect ran to recompute double = $double")
    }

    Scaffold(
        topBar = { TopAppBar(title = { Text("Misused Effects Example") }) }
    ) { padding ->
        Column(
            modifier = Modifier
                .padding(padding)
                .padding(16.dp)
        ) {
            Text(text = "Value: $value")
            Text(text = "Double (stored in state via effect): $double")
            Spacer(Modifier.height(8.dp))
            Button(onClick = { value++ }) {
                Text("Increment")
            }
        }
    }
}
