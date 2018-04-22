package ogiwara.jp.minecraft.presentation

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import ogiwara.jp.minecraft.R
import ogiwara.jp.minecraft.infrastructure.MCServerAPI
import org.jetbrains.anko.AnkoLogger
import org.jetbrains.anko.info
import kotlin.math.log

class MainActivity : AppCompatActivity(), AnkoLogger{

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val recyclerView = findViewById<RecyclerView>(R.id.recycler_view_minecraft)
        recyclerView.setHasFixedSize(true)

        val layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager

        MCServerAPI
                .getMinecrafts()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe({
                    recyclerView.adapter = MinecraftAdapter(it)

                    info { "Loaded" }
                },{
                    throw IllegalStateException()
                })
    }
}
