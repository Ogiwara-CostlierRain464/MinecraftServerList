package ogiwara.jp.minecraft.presentation

import android.support.v7.widget.RecyclerView
import android.view.View
import android.view.ViewGroup
import ogiwara.jp.minecraft.domain.model.Minecraft

class MinecraftAdapter(private val dataset: List<Minecraft>) : RecyclerView.Adapter<MinecraftAdapter.MinecraftViewHolder>(){

    class MinecraftViewHolder(v: View) : RecyclerView.ViewHolder(v)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MinecraftViewHolder {
         return MinecraftViewHolder(MinecraftView(parent.context))
    }

    override fun onBindViewHolder(holder: MinecraftViewHolder, position: Int) {
        val minecraftView = holder.itemView as MinecraftView
        minecraftView.setItem(dataset[position])
    }

    override fun getItemCount() = dataset.size
}