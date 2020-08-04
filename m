Subject: Re: ERROR: Kernel configuration is invalid
To: meta-virtualization@lists.yoctoproject.org
From: "Ashish" <ashishm@mvista.com>
X-Originating-Location: Thane, Maharashtra, IN (139.5.45.150)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 04 Aug 2020 00:03:49 -0700
References: <nRJC.1596462410038971461.CDAD@lists.yoctoproject.org>
In-Reply-To: <nRJC.1596462410038971461.CDAD@lists.yoctoproject.org>
Message-ID: <26552.1596524629370963978@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="WDQsC1dDXKezoAw6aqUT"

--WDQsC1dDXKezoAw6aqUT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Futher debugging , i can observe that .config is present=C2=A0 & i can exec=
ute $ bitbake -c menuconfig virtual/kernel

1) With RPI4
Observation :=C2=A0Error of kernel_configuration
Config file=C2=A0 =C2=A0 :=C2=A0 Is present at
/home/ashish/yocto-default/build-xenimage/tmp/work/raspberrypi4_64-poky-li=
nux/linux-raspberrypi/1_5.4.51+gitAUTOINC+aafb8f095e_machine-r0/linux-raspb=
errypi4_64-standard-build/.config

2) With Qemu
Observation: No Error for configuration
Config file=C2=A0 =C2=A0 :=C2=A0 Is present at
/home/ashish/yocto-default/build-qemu/tmp/work/qemuarm64-poky-linux/linux-=
yocto/5.4.49+gitAUTOINC+30814016b3_ec485bd4af-r0/linux-qemuarm64-standard-b=
uild/.config

Any pointers as to why error even though we have an config file being pres=
ent or i am missing any thing here

--WDQsC1dDXKezoAw6aqUT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Futher debugging , i can observe that .config is present&nbsp; &amp; i can =
execute $ bitbake -c menuconfig virtual/kernel&nbsp;<br /><br />1) With RPI=
4&nbsp;<br />&nbsp; &nbsp; &nbsp;Observation :&nbsp;Error of kernel_configu=
ration<br />&nbsp; &nbsp; &nbsp;Config file&nbsp; &nbsp; :&nbsp; Is present=
 at <br />/home/ashish/yocto-default/build-xenimage/tmp/work/raspberrypi4_6=
4-poky-linux/linux-raspberrypi/1_5.4.51+gitAUTOINC+aafb8f095e_machine-r0/li=
nux-raspberrypi4_64-standard-build/.config
<div><br /><br />2) With Qemu&nbsp;<br />&nbsp; &nbsp; Observation: No Err=
or for configuration&nbsp;<br />&nbsp; &nbsp; Config file&nbsp; &nbsp; :&nb=
sp; Is present at&nbsp;&nbsp;&nbsp;<br />/home/ashish/yocto-default/build-q=
emu/tmp/work/qemuarm64-poky-linux/linux-yocto/5.4.49+gitAUTOINC+30814016b3_=
ec485bd4af-r0/linux-qemuarm64-standard-build/.config<br /><br />Any pointer=
s as to why error even though we have an config file being present or i am =
missing any thing here&nbsp;</div>

--WDQsC1dDXKezoAw6aqUT--
