package ogiwara.jp.minecraft.infrastructure

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory

object MCServerAPI {

    private const val BASE_URL = "http://ogiwara.ddo.jp:8080/api/"

    private val client =
            Retrofit.Builder()
                    .baseUrl(BASE_URL)
                    .addConverterFactory(MoshiConverterFactory.create())
                    .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                    .build()
                    .create(MCServerService::class.java)

    fun getMinecrafts() = client.getMinecrafts()

    fun getMinecraft(id: Int) = client.getMinecraft(id)
}