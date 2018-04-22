package ogiwara.jp.minecraft

import ogiwara.jp.minecraft.infrastructure.MCServerAPI
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Ignore
import org.junit.Test

class ExampleUnitTest {

    private var id: Int = 0

    @Before
    fun initId(){
        id = 1 //ogiwara
    }


    @Test
    fun getMinecraftsTest() {
        assertEquals(MCServerAPI.getMinecrafts().blockingGet().first().name, "aha")
    }

    @Ignore
    @Test
    fun getMinecraftTest(){
        assertNotNull(MCServerAPI.getMinecraft(id).blockingGet())
    }

    //TODO Retrofit Mock Server Test
}
