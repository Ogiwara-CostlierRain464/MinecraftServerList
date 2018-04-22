package ogiwara.jp.minecraft.infrastructure

import io.reactivex.Observable
import io.reactivex.Single
import ogiwara.jp.minecraft.domain.model.Minecraft
import retrofit2.http.GET
import retrofit2.http.Path

interface MCServerService {

    @GET("minecrafts")
    fun getMinecrafts(): Single<List<Minecraft>>

    @GET("minecrafts/{id}")
    fun getMinecraft(@Path("id") id: Int): Single<Minecraft>

}