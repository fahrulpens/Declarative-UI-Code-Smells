package examples.compose

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * DUIS-05 – BUSINESS LOGIC IN VIEW
 *
 * Composable directly:
 *  - contains the "eligibility" rule (domain logic),
 *  - calls a fake API,
 *  - manages everything in the UI layer instead of delegating to ViewModel/use-case.
 */

@Composable
fun BusinessLogicInViewExample() {
    var ageInput by remember { mutableStateOf("") }
    var eligible by remember { mutableStateOf(false) }

    suspend fun checkEligibility(age: Int): Boolean {
        // Fake API
        kotlinx.coroutines.delay(500)
        // Domain rule embedded in the UI
        return age in 18..65
    }

    // Note: This is still "valid" Compose code, but architecturally smelly:
    // domain logic + remote call in the UI.
    LaunchedEffect(ageInput) {
        val ageInt = ageInput.toIntOrNull()
        eligible = ageInt?.let { checkEligibility(it) } ?: false
    }

    Scaffold(
        topBar = { TopAppBar(title = { Text("Business Logic in View") }) }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            OutlinedTextField(
                value = ageInput,
                onValueChange = { ageInput = it },
                label = { Text("Age") },
                modifier = Modifier.fillMaxWidth()
            )
            Spacer(Modifier.height(8.dp))
            Text(text = if (eligible) "Eligible" else "Not eligible")
        }
    }
}
