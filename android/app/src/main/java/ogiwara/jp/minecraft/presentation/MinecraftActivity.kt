package ogiwara.jp.minecraft.presentation

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import ogiwara.jp.minecraft.R
import ogiwara.jp.minecraft.domain.model.Minecraft
import org.jetbrains.anko.find
import us.feras.mdv.MarkdownView

class MinecraftActivity : AppCompatActivity() {

    private val introduction by lazy {
        find<TextView>(R.id.text_introduction)
    }

    private val description by lazy {
        find<MarkdownView>(R.id.text_description)
    }

    private val ip by lazy {
        find<TextView>(R.id.text_ip)
    }

    private val port by lazy {
        find<TextView>(R.id.text_port)
    }

    private lateinit var minecraft: Minecraft


    companion object {
        const val MODEL = "MODEL"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_minecraft)

        minecraft = intent.getParcelableExtra(MODEL)

        loadView()
    }

    private fun loadView() {
        introduction.text = minecraft.introduction
        description.loadMarkdown(minecraft.description)
        ip.text = minecraft.ip
        port.text = minecraft.port
    }
}
