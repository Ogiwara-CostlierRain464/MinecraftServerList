package ogiwara.jp.minecraft.presentation

import android.content.Context
import android.content.Intent
import android.util.AttributeSet
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.TextView
import ogiwara.jp.minecraft.R
import ogiwara.jp.minecraft.domain.model.Minecraft
import org.jetbrains.anko.find
import org.jetbrains.anko.intentFor
import java.util.jar.Attributes

class MinecraftView(c: Context, attrs: AttributeSet? = null): FrameLayout(c, attrs), View.OnClickListener{

    private lateinit var minecraft: Minecraft

    private val name by lazy {
        find<TextView>(R.id.text_name)
    }

    private val introduction by lazy {
        find<TextView>(R.id.text_introduction)
    }

    init{
        loadLayout()
    }

    private fun loadLayout(){
        LayoutInflater.from(context)
                .inflate(R.layout.list_item, this)

        setOnClickListener(this)
    }

    fun setItem(minecraft: Minecraft){

        this.minecraft = minecraft

        name.text = minecraft.name
        introduction.text = minecraft.introduction
    }

    override fun onClick(v: View) {
        val intent = context.intentFor<MinecraftActivity>(MinecraftActivity.MODEL to minecraft)
        context.startActivity(intent)
    }
}