Subject: Re: Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (137.97.30.106)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Jul 2020 07:32:43 -0700
References: <CAEkELtBMdM-V6OGn5TGXE_3L57QSAa_3ZagpWUC8xUWh4wcZkw@mail.gmail.com>
In-Reply-To: <CAEkELtBMdM-V6OGn5TGXE_3L57QSAa_3ZagpWUC8xUWh4wcZkw@mail.gmail.com>
Message-ID: <13067.1595428363223233314@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0C4M6G2eyFxNIzxQf7wk"

--0C4M6G2eyFxNIzxQf7wk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi sir,

I tried to do some work on patch you suggested but sadly I didn't get how =
to download the=C2=A0 patches from the https://github.com/dozylynx/meta-vir=
tualization ( https://github.com/dozylynx/meta-virtualization ) I tried a l=
ot and also googled to get some knowledge but that also didn't help me. So =
I directly downloaded the raspberry-pi4-xen-series branch from https://gith=
ub.com/dozylynx/meta-virtualization ( https://github.com/dozylynx/meta-virt=
ualization ) and tried to build the image. But I got stuck with below error=
 :

>=20
> ####
> ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0
> do_fetch: Fetcher failure for URL:
> 'git://github.com/raspberrypi/linux.git;branch=3Drpi-5.4.y'. Unable to f=
etch
> URL from any source.
> ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky=
-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/temp/log=
.do_fetch.3928
>=20
> ERROR: Task
> (/home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi/recipes-k=
ernel/linux/linux-raspberrypi_5.4.bb:do_fetch)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3957 tasks of which 3949 didn't need to b=
e
> rerun and 1 failed.
> ####

Below is the detailed log:

*############Detailed Log###############
*

siddhu@siddhu:~/Documents/yocto/zindagi/build$ bitbake -k xen-image-minima=
l
Loading cache: 100% |############################################| Time: 0=
:00:01
Loaded 3347 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time: 0=
:00:02
Parsing of 2270 .bb files complete (2269 cached, 1 parsed). 3348 targets, =
147 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.44.0"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "universal"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "aarch64-poky-linux=
"
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "raspberrypi4-=
64"
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "poky"
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "3.0+snapshot-20200722"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "aarch64 cortexa72 crc crypto=
"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta
meta-poky
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "local-rpi:18b6b2ae819cbf0ef3=
858944b4cd02ab74df6607"
meta-oe
meta-networking
meta-filesystems
meta-python
meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "local-rpi:463f9a3e=
f0935d772a0be0437a8c09df64ed2f07"
meta-raspberrypi=C2=A0 =C2=A0 =C2=A0=3D "local-rpi:e589e0f3fda8f15f1093909=
328605e0bb6516d94"
meta-virtualization-raspberry-pi4-xen-series =3D "<unknown>:<unknown>"

Initialising tasks: 100% |#######################################| Time: 0=
:00:04
Sstate summary: Wanted 39 Found 3 Missed 36 Current 1554 (7% match, 97% co=
mplete)
NOTE: Executing Tasks

NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtualizatio=
n-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:do_deploy_=
source_date_epoch unihash changed to 9b3b0c4c8d476222964814d569df4d59e06a0a=
c0d3cb4abe0303a982099a8c16
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_package became valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_packagedata became valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_populate_sysroot became valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_package_qa became valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_deploy became valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-virt=
ualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:d=
o_package_write_rpm became valid
NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi/r=
ecipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_deploy_source_date_epoch uni=
hash changed to 54770a4ded5d4d2dc259fae6f2332be28f4aecac039c1017fd674e39423=
2a6fe
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-rasp=
berrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_populate_sysroot be=
came valid
NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta-rasp=
berrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_deploy became valid
NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtualizatio=
n-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:do_populat=
e_lic unihash changed to 604c548ce45ed5d7741ef76d7453ce49359921b4c716d9b729=
5a8b6884b9e47e
NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtualizatio=
n-raspberry-pi4-xen-series/recipes-extended/images/xen-image-minimal.bb:do_=
deploy_source_date_epoch unihash changed to 35ac984fe0e0bb454791c4e70320015=
bd433949b6c0bc35761bd7b745359428d
NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi/r=
ecipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_populate_lic unihash changed=
 to 933fb59a1811901b6756f733da986f69cdb626258cff5004b436566968ce7883
NOTE: Setscene tasks completed
WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do_fe=
tch: Failed to fetch URL git://github.com/raspberrypi/linux.git;branch=3Drp=
i-5.4.y, attempting MIRRORS if available
ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do_fetc=
h: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON=
_SYSCONFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/us=
er/1000/bus,guid=3Dfb644bd839a1d48731370a435f1822fc"; export SSH_AGENT_PID=
=3D"1608"; export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export PAT=
H=3D"/home/siddhu/Documents/yocto/zindagi/build/tmp/sysroots-uninative/x86_=
64-linux/usr/bin:/home/siddhu/Documents/yocto/zindagi/sources/poky/scripts:=
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-li=
nux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/recipe-sysr=
oot-native/usr/bin/aarch64-poky-linux:/home/siddhu/Documents/yocto/zindagi/=
build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUT=
OINC+aafb8f095e_machine-r0/recipe-sysroot/usr/bin/crossscripts:/home/siddhu=
/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-ra=
spberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/recipe-sysroot-native/u=
sr/sbin:/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64=
-poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/rec=
ipe-sysroot-native/usr/bin:/home/siddhu/Documents/yocto/zindagi/build/tmp/w=
ork/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f=
095e_machine-r0/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/zin=
dagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+g=
itAUTOINC+aafb8f095e_machine-r0/recipe-sysroot-native/bin:/home/siddhu/Docu=
ments/yocto/zindagi/sources/poky/bitbake/bin:/home/siddhu/Documents/yocto/z=
indagi/build/tmp/hosttools"; export HOME=3D"/home/siddhu"; LANG=3DC git -c =
core.fsyncobjectfiles=3D0 clone --bare --mirror git://github.com/raspberryp=
i/linux.git /home/siddhu/Documents/yocto/zindagi/build/downloads/git2/githu=
b.com.raspberrypi.linux.git --progress failed with exit code 128, output:
Cloning into bare repository '/home/siddhu/Documents/yocto/zindagi/build/d=
ownloads/git2/github.com.raspberrypi.linux.git'...
remote: Enumerating objects: 8449639, done.
fatal: read error: Connection reset by peer768.82 MiB | 191.00 KiB/s
fatal: early EOF
fatal: index-pack failed

ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do_fetc=
h: Fetcher failure for URL: 'git://github.com/raspberrypi/linux.git;branch=
=3Drpi-5.4.y'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/zindagi/=
build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUT=
OINC+aafb8f095e_machine-r0/temp/log.do_fetch.3928
ERROR: Task (/home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi=
/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch) failed with exit c=
ode '1'
NOTE: Tasks Summary: Attempted 3957 tasks of which 3949 didn't need to be =
rerun and 1 failed.

Summary: 1 task failed:
/home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi/recipes-kern=
el/linux/linux-raspberrypi_5.4.bb:do_fetch
siddhu@siddhu:~/Documents/yocto/zindagi/build$

*###############################*

The other layers I was using along with the aspberry-pi4-xen-series branch=
 from https://github.com/dozylynx/meta-virtualization ( https://github.com/=
dozylynx/meta-virtualization ) are as below:

git:// git.yoctoproject.org/poky ( http://git.yoctoproject.org/poky )
18b6b2ae819cbf0ef3858944b4cd02 ab74df6607
git:// git.openembedded.org/meta-openembedded ( http://git.openembedded.or=
g/meta-openembedded )
463f9a3ef0935d772a0be0437a8c09 df64ed2f07
git:// git.yoctoproject.org/meta-raspberrypi ( http://git.yoctoproject.org=
/meta-raspberrypi )
e589e0f3fda8f15f1093909328605e 0bb6516d94

Even earlier when I started this work, I got this error but later when Chr=
istopher sir suggested the commit no's this got resolved.I think now also I=
 am missing some important points.

Later I read the https://lists.yoctoproject.org/g/meta-virtualization/mess=
age/5464 ( https://lists.yoctoproject.org/g/meta-virtualization/message/546=
4 ) there Christopher sir told we should checkout the meta-raspberrypi: 557=
6a22061864bc451ec4fcacb7d830bf76b7ebd and meta-virtualization: d75bc448866d=
2b36779251efb1310d0234ece30b, plus t his patch series applied on top, or cl=
one the raspberry-pi4-xen-series branch from his repository.

As I didn't know how to download the patches, I cloned the above through b=
elow commands:

1. git clone git:// git.yoctoproject.org/ meta-raspberrypi ( http://git.yo=
ctoproject.org/meta-raspberrypi )
cd meta-raspberrypi
git checkout 5576a22061864bc451ec4fcacb7d830bf76b7ebd

2. git clone https://github.com/dozylynx/ meta-virtualization ( https://gi=
thub.com/dozylynx/meta-virtualization ) -b raspberry-pi4-xen-series

And I have below lines in my local.conf:

MACHINE =3D "raspberrypi4-64"
DISTRO_FEATURES_append =3D " xen virtualization"
QEMU_TARGETS =3D "i386 x86_64 aarch64 arm"
PACKAGECONFIG_pn-qemu +=3D " xen fdt"
PACKAGECONFIG_remove_pn-qemu +=3D " sdl"
IMAGE_FSTYPES =3D "tar.xz tar.bz2 ext3 rpi-sdimg"

Is this ok sir? I have not built yet but before I start building I wanted =
to know If I am on right path. Why I doubt here is I am didn't get the prop=
er grip on yocto yet.

Can I build the image by " $ bitbake -k xen-image-minimal " ?

--
Best Regards,
Siddhartha V

--0C4M6G2eyFxNIzxQf7wk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi sir,<br /><br />&nbsp;I tried to do some work on patch you suggested but=
 sadly I didn't get how to download the&nbsp; patches from the&nbsp;<a href=
=
=3D"https://github.com/dozylynx/meta-virtualization" target=3D"_blank" rel=
=
=3D"nofollow noopener">https://github.com/dozylynx/meta-virtualization&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>I tried a lot and also googled to get s=
ome knowledge but that also didn't help me. So I directly downloaded the&nb=
sp;<span>raspberry-pi4-xen-series branch from </span><a href=3D"https://git=
hub.com/dozylynx/meta-virtualization" target=3D"_blank" rel=3D"nofollow noo=
pener">https://github.com/dozylynx/meta-virtualization&nbsp;</a>and tried t=
o build the image. But I got stuck with below error :<br />
<blockquote>####
<div>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do=
_fetch: Fetcher failure for URL: 'git://github.com/raspberrypi/linux.git;br=
anch=3Drpi-5.4.y'. Unable to fetch URL from any source.</div>
<div>ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/zin=
dagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+g=
itAUTOINC+aafb8f095e_machine-r0/temp/log.do_fetch.3928</div>
<div>ERROR: Task (/home/siddhu/Documents/yocto/zindagi/sources/meta-raspbe=
rrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch) failed with e=
xit code '1'</div>
<div>NOTE: Tasks Summary: Attempted 3957 tasks of which 3949 didn't need t=
o be rerun and 1 failed.</div>
####</blockquote>
Below is the detailed log:<br /><br /><br /><strong>############Detailed L=
og###############<br /></strong>
<div>&nbsp;</div>
<div>siddhu@siddhu:~/Documents/yocto/zindagi/build$ bitbake -k xen-image-m=
inimal&nbsp;</div>
<div>Loading cache: 100% |############################################| Ti=
me: 0:00:01</div>
<div>Loaded 3347 entries from dependency cache.</div>
<div>Parsing recipes: 100% |##########################################| Ti=
me: 0:00:02</div>
<div>Parsing of 2270 .bb files complete (2269 cached, 1 parsed). 3348 targ=
ets, 147 skipped, 0 masked, 0 errors.</div>
<div>NOTE: Resolving any missing task queue dependencies</div>
<div>&nbsp;</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "1.44.0"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"=
</div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "universal"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "aarch64-poky-=
linux"</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "raspberr=
ypi4-64"</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "pok=
y"</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D "3.0+snapshot-20200722"<=
/div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "aarch64 cortexa72 crc c=
rypto"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</d=
iv>
<div>meta-poky&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-yocto-bsp&nbsp; &nbsp; &nbsp; &nbsp;=3D "local-rpi:18b6b2ae819cb=
f0ef3858944b4cd02ab74df6607"</div>
<div>meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-networking&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-filesystems&nbsp; &nbsp; &nbsp;</div>
<div>meta-python&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-perl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "local-rpi:463=
f9a3ef0935d772a0be0437a8c09df64ed2f07"</div>
<div>meta-raspberrypi&nbsp; &nbsp; &nbsp;=3D "local-rpi:e589e0f3fda8f15f10=
93909328605e0bb6516d94"</div>
<div>meta-virtualization-raspberry-pi4-xen-series =3D "&lt;unknown&gt;:&lt=
;unknown&gt;"</div>
<div>&nbsp;</div>
<div>Initialising tasks: 100% |#######################################| Ti=
me: 0:00:04</div>
<div>Sstate summary: Wanted 39 Found 3 Missed 36 Current 1554 (7% match, 9=
7% complete)</div>
<div>NOTE: Executing Tasks</div>
<div>&nbsp;</div>
<div>NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtuali=
zation-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:do_de=
ploy_source_date_epoch unihash changed to 9b3b0c4c8d476222964814d569df4d59e=
06a0ac0d3cb4abe0303a982099a8c16</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_package became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_packagedata became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_populate_sysroot became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_package_qa became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_deploy became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-virtualization-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git=
.bb:do_package_write_rpm became valid</div>
<div>NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-raspberr=
ypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_deploy_source_date_epoc=
h unihash changed to 54770a4ded5d4d2dc259fae6f2332be28f4aecac039c1017fd674e=
394232a6fe</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_populate_sysro=
ot became valid</div>
<div>NOTE: Setscene task /home/siddhu/Documents/yocto/zindagi/sources/meta=
-raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_deploy became =
valid</div>
<div>NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtuali=
zation-raspberry-pi4-xen-series/recipes-extended/xen/xen-tools_git.bb:do_po=
pulate_lic unihash changed to 604c548ce45ed5d7741ef76d7453ce49359921b4c716d=
9b7295a8b6884b9e47e</div>
<div>NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-virtuali=
zation-raspberry-pi4-xen-series/recipes-extended/images/xen-image-minimal.b=
b:do_deploy_source_date_epoch unihash changed to 35ac984fe0e0bb454791c4e703=
20015bd433949b6c0bc35761bd7b745359428d</div>
<div>NOTE: Task /home/siddhu/Documents/yocto/zindagi/sources/meta-raspberr=
ypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bb:do_populate_lic unihash ch=
anged to 933fb59a1811901b6756f733da986f69cdb626258cff5004b436566968ce7883</=
div>
<div>NOTE: Setscene tasks completed</div>
<div>WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 =
do_fetch: Failed to fetch URL git://github.com/raspberrypi/linux.git;branch=
=
=3Drpi-5.4.y, attempting MIRRORS if available</div>
<div>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do=
_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _P=
YTHON_SYSCONFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/r=
un/user/1000/bus,guid=3Dfb644bd839a1d48731370a435f1822fc"; export SSH_AGENT=
_PID=3D"1608"; export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export =
PATH=3D"/home/siddhu/Documents/yocto/zindagi/build/tmp/sysroots-uninative/x=
86_64-linux/usr/bin:/home/siddhu/Documents/yocto/zindagi/sources/poky/scrip=
ts:/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky=
-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/recipe-s=
ysroot-native/usr/bin/aarch64-poky-linux:/home/siddhu/Documents/yocto/zinda=
gi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+git=
AUTOINC+aafb8f095e_machine-r0/recipe-sysroot/usr/bin/crossscripts:/home/sid=
dhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/linux=
-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4=
_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/=
recipe-sysroot-native/usr/bin:/home/siddhu/Documents/yocto/zindagi/build/tm=
p/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aaf=
b8f095e_machine-r0/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/=
zindagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.4=
0+gitAUTOINC+aafb8f095e_machine-r0/recipe-sysroot-native/bin:/home/siddhu/D=
ocuments/yocto/zindagi/sources/poky/bitbake/bin:/home/siddhu/Documents/yoct=
o/zindagi/build/tmp/hosttools"; export HOME=3D"/home/siddhu"; LANG=3DC git =
-c core.fsyncobjectfiles=3D0 clone --bare --mirror git://github.com/raspber=
rypi/linux.git /home/siddhu/Documents/yocto/zindagi/build/downloads/git2/gi=
thub.com.raspberrypi.linux.git --progress failed with exit code 128, output=
:</div>
<div>Cloning into bare repository '/home/siddhu/Documents/yocto/zindagi/bu=
ild/downloads/git2/github.com.raspberrypi.linux.git'...</div>
<div>remote: Enumerating objects: 8449639, done.&nbsp; &nbsp; &nbsp; &nbsp=
;&nbsp;</div>
<div>fatal: read error: Connection reset by peer768.82 MiB | 191.00 KiB/s&=
nbsp; &nbsp;</div>
<div>fatal: early EOF</div>
<div>fatal: index-pack failed</div>
<div>&nbsp;</div>
<div>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do=
_fetch: Fetcher failure for URL: 'git://github.com/raspberrypi/linux.git;br=
anch=3Drpi-5.4.y'. Unable to fetch URL from any source.</div>
<div>ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/zin=
dagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+g=
itAUTOINC+aafb8f095e_machine-r0/temp/log.do_fetch.3928</div>
<div>ERROR: Task (/home/siddhu/Documents/yocto/zindagi/sources/meta-raspbe=
rrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch) failed with e=
xit code '1'</div>
<div>NOTE: Tasks Summary: Attempted 3957 tasks of which 3949 didn't need t=
o be rerun and 1 failed.</div>
<div>&nbsp;</div>
<div>Summary: 1 task failed:</div>
<div>&nbsp; /home/siddhu/Documents/yocto/zindagi/sources/meta-raspberrypi/=
recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch</div>
<div>siddhu@siddhu:~/Documents/yocto/zindagi/build$&nbsp;</div>
<div>&nbsp;</div>
<div><strong>###############################</strong></div>
<br /><br />The other layers I was using along with the&nbsp;<span>aspberr=
y-pi4-xen-series branch from </span><a href=3D"https://github.com/dozylynx/=
meta-virtualization" target=3D"_blank" rel=3D"nofollow noopener">https://gi=
thub.com/dozylynx/meta-virtualization&nbsp;&nbsp;</a>are as below:<br /><br=
 /><span style=3D"font-family: sans-serif; font-size: 12.8px;">git://</span=
><a href=3D"http://git.yoctoproject.org/poky" target=3D"_blank" rel=3D"nofo=
llow noopener">git.yoctoproject.org/poky</a><br /><span style=3D"font-famil=
y: sans-serif; font-size: 12.8px;">&nbsp; 18b6b2ae819cbf0ef3858944b4cd02</s=
pan><span style=3D"font-family: sans-serif; font-size: 12.8px;">ab74df6607<=
/span><br /><span style=3D"font-family: sans-serif; font-size: 12.8px;">git=
://</span><a href=3D"http://git.openembedded.org/meta-openembedded" target=
=3D"_blank" rel=3D"nofollow noopener">git.openembedded.org/meta-openembedd=
ed</a><br /><span style=3D"font-family: sans-serif; font-size: 12.8px;">&nb=
sp; 463f9a3ef0935d772a0be0437a8c09</span><span style=3D"font-family: sans-s=
erif; font-size: 12.8px;">df64ed2f07</span><br /><span style=3D"font-family=
: sans-serif; font-size: 12.8px;">git://</span><a href=3D"http://git.yoctop=
roject.org/meta-raspberrypi" target=3D"_blank" rel=3D"nofollow noopener">gi=
t.yoctoproject.org/meta-raspberrypi</a><br /><span style=3D"font-family: sa=
ns-serif; font-size: 12.8px;">&nbsp; e589e0f3fda8f15f1093909328605e</span><=
span style=3D"font-family: sans-serif; font-size: 12.8px;">0bb6516d94<br />=
</span><br />Even earlier when I started this work, I got this error but la=
ter when Christopher sir suggested the commit no's this got resolved.I thin=
k now also I am missing some important points.<br /><br /><br /><br />&nbsp=
;Later I read the&nbsp;<a href=3D"https://lists.yoctoproject.org/g/meta-vir=
tualization/message/5464" target=3D"_blank" rel=3D"nofollow noopener">https=
://lists.yoctoproject.org/g/meta-virtualization/message/5464 &nbsp;&nbsp;&n=
bsp;</a>there Christopher sir told we should checkout the&nbsp;<span>meta-r=
aspberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd and </span><span>meta-=
virtualization: d75bc448866d2b36779251efb1310d0234ece30b, plus t</span><spa=
n>his patch series applied on top, or clone the </span><span>raspberry-pi4-=
xen-series branch from his repository. <br /><br />As I didn't know how to =
download the patches, I cloned the above through below commands:<br /><br /=
></span>1.&nbsp;<span style=3D"color: #222222; font-family: Arial, Helvetic=
a, sans-serif; font-size: small;">git clone git://</span><a href=3D"http://=
git.yoctoproject.org/meta-raspberrypi" target=3D"_blank" rel=3D"nofollow no=
opener">git.yoctoproject.org/<wbr />meta-raspberrypi</a><br /><span style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">cd meta-raspberrypi</span><br /><span style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;">git checkout&nbsp=
;</span><span>5576a22061864bc451ec4fcacb7d830bf76b7ebd<br /><br /></span>2.=
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">git clone&nbsp;</span><a href=3D"https://github.com/dozyl=
ynx/meta-virtualization" target=3D"_blank" rel=3D"nofollow noopener">https:=
//github.com/dozylynx/<wbr />meta-virtualization &nbsp;</a>-b&nbsp;&nbsp;<s=
pan>raspberry-pi4-xen-series<br /><br /></span>And I have below lines in my=
 local.conf:<br /><br />
<div>MACHINE =3D "raspberrypi4-64"</div>
<div>DISTRO_FEATURES_append =3D " xen virtualization"</div>
<div>QEMU_TARGETS =3D "i386 x86_64 aarch64 arm"</div>
<div>PACKAGECONFIG_pn-qemu +=3D " xen fdt"</div>
<div>PACKAGECONFIG_remove_pn-qemu +=3D " sdl"</div>
<div>IMAGE_FSTYPES =3D "tar.xz tar.bz2 ext3 rpi-sdimg"</div>
<br />Is this ok sir? I have not built yet but before I start building I w=
anted to know If I am on right path. Why I doubt here is I am didn't get th=
e proper grip on yocto yet.<br /><br />Can I build the image by " $ bitbake=
 -k xen-image-minimal " ?<br /><br /><br />-- <br />Best Regards,<br />Sidd=
hartha V

--0C4M6G2eyFxNIzxQf7wk--
