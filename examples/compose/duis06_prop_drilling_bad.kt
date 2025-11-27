package examples.compose

import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color

/**
 * DUIS-06 – PROP DRILLING
 *
 * A color (themeColor) is passed through intermediate composables that don't use it,
 * only to reach a deep child. Similar to React's prop drilling.
 */

@Composable
fun PropDrillingRoot() {
    Scaffold(
        topBar = { TopAppBar(title = { Text("Prop Drilling Example") }) }
    ) { padding ->
        LevelOne(themeColor = Color.Blue, modifier = Modifier.padding(padding))
    }
}

@Composable
fun LevelOne(themeColor: Color, modifier: Modifier = Modifier) {
    // Does not use themeColor, just forwards
    LevelTwo(themeColor = themeColor, modifier = modifier)
}

@Composable
fun LevelTwo(themeColor: Color, modifier: Modifier = Modifier) {
    // Still just forwards
    LevelThree(themeColor = themeColor, modifier = modifier)
}

@Composable
fun LevelThree(themeColor: Color, modifier: Modifier = Modifier) {
    Text(
        text = "Deep child using themeColor",
        color = themeColor,
        modifier = modifier
    )
}
