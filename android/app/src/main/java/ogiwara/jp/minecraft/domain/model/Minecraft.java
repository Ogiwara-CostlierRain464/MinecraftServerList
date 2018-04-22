package ogiwara.jp.minecraft.domain.model;

import android.os.Parcel;
import android.os.Parcelable;

public class Minecraft implements Parcelable {
    public String name;
    public String introduction;
    public String description;
    public String ip;
    public String port;

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.name);
        dest.writeString(this.introduction);
        dest.writeString(this.description);
        dest.writeString(this.ip);
        dest.writeString(this.port);
    }

    public Minecraft() {
    }

    protected Minecraft(Parcel in) {
        this.name = in.readString();
        this.introduction = in.readString();
        this.description = in.readString();
        this.ip = in.readString();
        this.port = in.readString();
    }

    public static final Parcelable.Creator<Minecraft> CREATOR = new Parcelable.Creator<Minecraft>() {
        @Override
        public Minecraft createFromParcel(Parcel source) {
            return new Minecraft(source);
        }

        @Override
        public Minecraft[] newArray(int size) {
            return new Minecraft[size];
        }
    };
}