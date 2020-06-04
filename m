Subject: How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
To: meta-virtualization@lists.yoctoproject.org
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (27.63.56.23)
X-Originating-Platform: Linux Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 Jun 2020 05:05:45 -0700
Message-ID: <F6Xm.1591272345632844743.Xl2d@lists.yoctoproject.org>
X-Groupsio-MsgNum: 5384
Content-Type: multipart/mixed; boundary="gbC9QBSyEHijA8Bse5ap"

--gbC9QBSyEHijA8Bse5ap
Content-Type: multipart/alternative; boundary="B2aU3itiMIg9mXlKMfox"

--B2aU3itiMIg9mXlKMfox
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello dear meta-virtualization team,

I am building the xen minimal image using yocto warrior ("bitbake xen-imag=
e-minimal") by giving the target machine as "raspberrypi4".
Sorry for reposting I have already created a post ( Failure to build xen-i=
mage-minimal. Yocto bitbake failed @99% while building xen-minimal-image ( =
https://lists.yoctoproject.org/g/meta-virtualization/topic/failure_to_build=
/74495311?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,74495311 ) ). F=
rom past ten days I have been stuck here. I felt it might not be reaching t=
he purpose so I am creating again.

My bblayer.conf file is as below:
# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.co=
nf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION =3D "2"
BBPATH =3D "${TOPDIR}"

BBFILES ?=3D ""
BBLAYERS ?=3D " \

/home/siddhu/Documents/yocto/sources/poky/meta \
/home/siddhu/Documents/yocto/sources/poky/meta-poky \
/home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
/home/siddhu/Documents/yocto/sources/meta-cloud-services \
/home/siddhu/Documents/yocto/sources/meta-selinux \
/home/siddhu/Documents/yocto/sources/meta-virtualization\
/home/siddhu/Documents/yocto/sources/meta-raspberrypi \
"

My local.conf file I have added the below details:
MACHINE ??=3D "raspberrypi4"
DISTRO_FEATURES +=3D "virtualization xen"
PACKAGE_CLASSES ?=3D "package_rpm"
CONF_VERSION =3D "1"
IMAGE_FEATURES +=3D "ssh-server-dropbear"

*Actually I have manually enabled the "CONFIG_XEN=3Dy" (which was not set =
earlier) in .config file @ path :*
/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueab=
i/linux-raspberrypi/1_4.19.88+gitAUTOINC+988cc7beac-r0/linux-raspberrypi4-s=
tandard-build/
*later I anable "CONFIG_NETXEN_NIC=3Dy"* *(* which was not set earlier)
But even then I am not able to build the final kernel image.

*But I am getting a warning:*
WARNING: /home/siddhu/Documents/yocto/sources/meta-raspberrypi/recipes-ker=
nel/linux/linux-raspberrypi_4.19.bb.do_compile is tainted from a forced run
Initialising tasks: 100% |#######################################| Time: 0=
:00:04
Sstate summary: Wanted 27 Found 25 Missed 2 Current 840 (92% match, 99% co=
mplete)

Will it impact on image anyway?

*Below is the my error details:*

>=20
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> *ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.* Comma=
nd
> '/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnu=
eabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf
> -v --rpmverbosity=3Dinfo -y -c
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnue=
abi/xen-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
> --setopt=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum.repos.d
> --installroot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4=
-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs
> --setopt=3Dlogdir=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberr=
ypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp
> --repofrompath=3Doe-repo,/home/siddhu/Documents/yocto/build/tmp/work/ras=
pberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
> --nogpgcheck install kernel-module-xen-blkback kernel-module-xen-gntallo=
c
> kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt
> packagegroup-core-boot packagegroup-core-ssh-dropbear
> packagegroup-core-ssh-openssh qemu run-postinsts xen-base
> locale-base-en-us locale-base-en-gb' returned 1:
> DNF version: 4.1.0
> cachedir:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnue=
abi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf
>=20
> Added oe-repo repo from
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnue=
abi/xen-image-minimal/1.0-r0/oe-rootfs-repo
>=20
> repo: using cache for: oe-repo
> not found other for:
> not found modules for:
> not found deltainfo for:
> not found updateinfo for:
> oe-repo: using metadata from Thu 04 Jun 2020 11:38:41 AM UTC.
> Last metadata expiration check: 0:00:01 ago on Thu 04 Jun 2020 11:38:42 =
AM
> UTC.
> No module defaults found
> No match for argument: kernel-module-xen-blkback
> No match for argument: kernel-module-xen-gntalloc
> No match for argument: kernel-module-xen-gntdev
> No match for argument: kernel-module-xen-netback
> No match for argument: kernel-module-xen-wdt
> Error: Unable to find a match
>=20
> *ERROR: xen-image-minimal-1.0-r0 do_rootfs:*
> *ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs*
> *ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnue=
abi/xen-image-minimal/1.0-r0/temp/log.do_rootfs.31739*
>=20
> *ERROR: Task
> (/home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extend=
ed/images/xen-image-minimal.bb:do_rootfs)
> failed with exit code '1'*
> NOTE: Tasks Summary: Attempted 2605 tasks of which 2604 didn't need to b=
e
> rerun and 1 failed.
>=20
> Summary: 1 task failed:
> /home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extende=
d/images/xen-image-minimal.bb:do_rootfs
>=20
>=20

I have tried the same for "cubieboard2" also even there I faced the same i=
ssue.Eagerly waiting for the response.

I have attached the recent log too Please help me on this.

Best Regards,
Siddhartha V

--B2aU3itiMIg9mXlKMfox
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont,=
 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI E=
moji';">Hello dear meta-virtualization team,</p>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';">I am building the xen minimal image using yocto warrior<span style=
=
=3D"font-weight: bold;">&nbsp;("bitbake xen-image-minimal")&nbsp;</span>by=
 giving the target machine as&nbsp;<span style=3D"font-weight: bold;">"rasp=
berrypi4"</span>.<br />Sorry for reposting I have already created a post (<=
a style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;" hr=
ef=3D"https://lists.yoctoproject.org/g/meta-virtualization/topic/failure_to=
_build/74495311?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,74495311"=
>Failure to build xen-image-minimal. Yocto bitbake failed @99% while buildi=
ng xen-minimal-image</a>). From past ten days I have been stuck here. I fel=
t it might not be reaching the purpose so I am creating again.</p>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';"><span style=3D"font-weight: bold;">My bblayer.conf file is as belo=
w:</span><br /><span style=3D"color: #24292e; font-family: -apple-system, B=
linkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color E=
moji', 'Segoe UI Emoji';"># POKY_BBLAYERS_CONF_VERSION is increased each ti=
me build/conf/bblayers.conf<br /></span><span style=3D"color: #24292e; font=
-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, s=
ans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';"># changes incompatibly<b=
r /></span><span style=3D"color: #24292e; font-family: -apple-system, Blink=
MacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji=
', 'Segoe UI Emoji';">POKY_BBLAYERS_CONF_VERSION =3D "2"<br /></span><span =
style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'S=
egoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoj=
i';">BBPATH =3D "${TOPDIR}"<br /><br /></span><span style=3D"color: #24292e=
; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Ar=
ial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">BBFILES ?=3D ""<br=
 /></span><span style=3D"color: #24292e; font-family: -apple-system, BlinkM=
acSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji'=
, 'Segoe UI Emoji';">BBLAYERS ?=3D " \</span></p>
<p><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSyst=
emFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Seg=
oe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/poky/meta \<br /=
></span><span style=3D"color: #24292e; font-family: -apple-system, BlinkMac=
SystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/poky/meta-po=
ky \<br /></span><span style=3D"color: #24292e; font-family: -apple-system,=
 BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color=
 Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/pok=
y/meta-yocto-bsp \<br /></span><span style=3D"color: #24292e; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yoc=
to/sources/meta-openembedded/meta-oe \<br /></span><span style=3D"color: #2=
4292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetic=
a, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/=
siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \<br /></s=
pan><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSyst=
emFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Seg=
oe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-openembedde=
d/meta-python \<br /></span><span style=3D"color: #24292e; font-family: -ap=
ple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/=
sources/meta-openembedded/meta-networking \<br /></span><span style=3D"colo=
r: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Hel=
vetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /=
home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \<br=
 /></span><span style=3D"color: #24292e; font-family: -apple-system, BlinkM=
acSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji'=
, 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-cloud=
-services \<br /></span><span style=3D"color: #24292e; font-family: -apple-=
system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Appl=
e Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sour=
ces/meta-selinux \<br /></span><span style=3D"color: #24292e; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yoc=
to/sources/meta-virtualization\<br /></span><span style=3D"color: #24292e; =
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Aria=
l, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/=
Documents/yocto/sources/meta-raspberrypi \<br /></span><span style=3D"color=
: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helv=
etica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; "<=
br /><br /><span style=3D"font-weight: bold;">My local.conf file I have add=
ed the below details:</span><br /></span><span style=3D"color: #24292e; fon=
t-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, =
sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">MACHINE ??=3D "raspberr=
ypi4"<br /></span><span style=3D"color: #24292e; font-family: -apple-system=
, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Colo=
r Emoji', 'Segoe UI Emoji';">DISTRO_FEATURES +=3D "virtualization xen"<br /=
></span><span style=3D"color: #24292e; font-family: -apple-system, BlinkMac=
SystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji';">PACKAGE_CLASSES ?=3D "package_rpm"<br /></span>CONF_VERS=
ION =3D "1"<br />IMAGE_FEATURES +=3D "ssh-server-dropbear"</p>
<div><strong>Actually I have manually enabled the "CONFIG_XEN=3Dy" (which =
was not set earlier) in .config file @ path :</strong>&nbsp;<br />
<div>/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-g=
nueabi/linux-raspberrypi/1_4.19.88+gitAUTOINC+988cc7beac-r0/linux-raspberry=
pi4-standard-build/</div>
<div><strong>later I anable "CONFIG_NETXEN_NIC=3Dy"</strong><span style=3D=
"font-weight: bold;"><strong>(</strong>which was not set earlier)&nbsp;</sp=
an><br />But even then I am not able to build the final kernel image.<br />=
<br /><strong>But I am getting a warning:&nbsp;</strong><br />
<div>WARNING: /home/siddhu/Documents/yocto/sources/meta-raspberrypi/recipe=
s-kernel/linux/linux-raspberrypi_4.19.bb.do_compile is tainted from a force=
d run</div>
<div>Initialising tasks: 100% |#######################################| Ti=
me: 0:00:04</div>
<div>Sstate summary: Wanted 27 Found 25 Missed 2 Current 840 (92% match, 9=
9% complete)</div>
<div><br />Will it impact on image anyway?<br /><br /><strong>Below is the=
 my error details:</strong><br /><br /><br /></div>
</div>
<blockquote>
<div>NOTE: Executing SetScene Tasks</div>
<div>NOTE: Executing RunQueue Tasks</div>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke d=
nf.</strong> Command '/home/siddhu/Documents/yocto/build/tmp/work/raspberry=
pi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/b=
in/dnf -v --rpmverbosity=3Dinfo -y -c /home/siddhu/Documents/yocto/build/tm=
p/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/=
dnf/dnf.conf --setopt=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/w=
ork/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum=
.repos.d --installroot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=
=
=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnu=
eabi/xen-image-minimal/1.0-r0/temp --repofrompath=3Doe-repo,/home/siddhu/Do=
cuments/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-mini=
mal/1.0-r0/oe-rootfs-repo --nogpgcheck install kernel-module-xen-blkback ke=
rnel-module-xen-gntalloc kernel-module-xen-gntdev kernel-module-xen-netback=
 kernel-module-xen-wdt packagegroup-core-boot packagegroup-core-ssh-dropbea=
r packagegroup-core-ssh-openssh qemu run-postinsts xen-base locale-base-en-=
us locale-base-en-gb' returned 1:</div>
<div>DNF version: 4.1.0</div>
<div>cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-po=
ky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf</div>
<div>Added oe-repo repo from /home/siddhu/Documents/yocto/build/tmp/work/r=
aspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo</div=
>
<div>repo: using cache for: oe-repo</div>
<div>not found other for:&nbsp;</div>
<div>not found modules for:&nbsp;</div>
<div>not found deltainfo for:&nbsp;</div>
<div>not found updateinfo for:&nbsp;</div>
<div>oe-repo: using metadata from Thu 04 Jun 2020 11:38:41 AM UTC.</div>
<div>Last metadata expiration check: 0:00:01 ago on Thu 04 Jun 2020 11:38:=
42 AM UTC.</div>
<div>No module defaults found</div>
<div>No match for argument: kernel-module-xen-blkback</div>
<div>No match for argument: kernel-module-xen-gntalloc</div>
<div>No match for argument: kernel-module-xen-gntdev</div>
<div>No match for argument: kernel-module-xen-netback</div>
<div>No match for argument: kernel-module-xen-wdt</div>
<div>Error: Unable to find a match</div>
<div>&nbsp;</div>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs:&nbsp;</strong></di=
v>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: d=
o_rootfs</strong></div>
<div><strong>ERROR: Logfile of failure stored in: /home/siddhu/Documents/y=
octo/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r=
0/temp/log.do_rootfs.31739</strong></div>
<div><strong>ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtua=
lization/recipes-extended/images/xen-image-minimal.bb:do_rootfs) failed wit=
h exit code '1'</strong></div>
<div>NOTE: Tasks Summary: Attempted 2605 tasks of which 2604 didn't need t=
o be rerun and 1 failed.</div>
<div>&nbsp;</div>
<div>Summary: 1 task failed:</div>
<div>&nbsp; /home/siddhu/Documents/yocto/sources/meta-virtualization/recip=
es-extended/images/xen-image-minimal.bb:do_rootfs</div>
</blockquote>
<div>&nbsp;</div>
I have tried the same for "cubieboard2" also even there I faced the same i=
ssue.Eagerly waiting for the response.</div>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';"><br />I have attached the recent log too Please help me on this.&n=
bsp;<br /><br /><br /></p>
Best Regards,<br />Siddhartha V

--B2aU3itiMIg9mXlKMfox--

--gbC9QBSyEHijA8Bse5ap
Content-Type: application/octet-stream; name="log.do_rootfs.31739"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="log.do_rootfs.31739"

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsndmlydHVhbDpuYXRpdmU6L2hvbWUvc2lkZGh1
L0RvY3VtZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWNfZ2l0LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUv
c2lkZGh1L0RvY3VtZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L21rbGlicy9ta2xpYnMtbmF0aXZlXzAuMS40NC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3Zp
cnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5L21l
dGEvcmVjaXBlcy1jb3JlL3VwZGF0ZS1yYy5kL3VwZGF0ZS1yYy5kXzAuOC5iYjpkb19wb3B1bGF0
ZV9zeXNyb290JywgJy9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5L21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXV3cmFwcGVyLWNyb3NzXzEuMC5iYjpkb19wb3B1
bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9j
dG8vc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTQuMi4xLmJi
OmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUvc2lkZGh1L0RvY3Vt
ZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18w
LjQuMC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRo
dS9Eb2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9waWd6
L3BpZ3pfMi40LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUv
c2lkZGh1L0RvY3VtZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ByZWxpbmsvcHJlbGlua19naXQuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5h
dGl2ZTovaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZl80LjEuMC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21l
L3NpZGRodS9Eb2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2ds
aWJjL2Nyb3NzLWxvY2FsZWRlZi1uYXRpdmVfMi4yOS5iYjpkb19wb3B1bGF0ZV9zeXNyb290Jywg
J3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlZGV2cy9tYWtlZGV2c18xLjAuMS5iYjpkb19wb3B1
bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9j
dG8vc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYnppcDIvcGJ6aXAyXzEuMS4x
My5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9E
b2N1bWVudHMveW9jdG8vc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnLXV0
aWxzL29wa2ctdXRpbHNfMC40LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9zaWRk
aHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9s
ZGNvbmZpZy1uYXRpdmVfMi4xMi4xLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpu
YXRpdmU6L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAn
L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWtl
cm5lbC9rbW9kL2RlcG1vZHdyYXBwZXItY3Jvc3NfMS4wLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Qn
XQpOT1RFOiBJbnN0YWxsZWQgaW50byBzeXNyb290OiBbXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJl
YWR5IGV4aXN0cyBpbiBzeXNyb290OiBbJ2NyZWF0ZXJlcG8tYy1uYXRpdmUnLCAnbWtsaWJzLW5h
dGl2ZScsICd1cGRhdGUtcmMuZC1uYXRpdmUnLCAncWVtdXdyYXBwZXItY3Jvc3MnLCAncnBtLW5h
dGl2ZScsICdvcGtnLW5hdGl2ZScsICdwaWd6LW5hdGl2ZScsICdwcmVsaW5rLW5hdGl2ZScsICdk
bmYtbmF0aXZlJywgJ2Nyb3NzLWxvY2FsZWRlZi1uYXRpdmUnLCAnbWFrZWRldnMtbmF0aXZlJywg
J3BiemlwMi1uYXRpdmUnLCAnb3BrZy11dGlscy1uYXRpdmUnLCAnbGRjb25maWctbmF0aXZlJywg
J3BzZXVkby1uYXRpdmUnLCAnZGVwbW9kd3JhcHBlci1jcm9zcycsICdxdWlsdC1uYXRpdmUnLCAn
ZmlsZS1uYXRpdmUnLCAnbGlieG1sMi1uYXRpdmUnLCAnb3BlbnNzbC1uYXRpdmUnLCAnY3VybC1u
YXRpdmUnLCAnZXhwYXQtbmF0aXZlJywgJ2NtYWtlLW5hdGl2ZScsICdzcWxpdGUzLW5hdGl2ZScs
ICd4ei1uYXRpdmUnLCAnZ2xpYi0yLjAtbmF0aXZlJywgJ3B5dGhvbjMtbmF0aXZlJywgJ3psaWIt
bmF0aXZlJywgJ25pbmphLW5hdGl2ZScsICdwa2djb25maWctbmF0aXZlJywgJ2RlYmlhbnV0aWxz
LW5hdGl2ZScsICdxZW11LW5hdGl2ZScsICdnbnUtY29uZmlnLW5hdGl2ZScsICdnZXR0ZXh0LW1p
bmltYWwtbmF0aXZlJywgJ2F1dG9tYWtlLW5hdGl2ZScsICdhdXRvY29uZi1uYXRpdmUnLCAnbGli
dG9vbC1uYXRpdmUnLCAna21vZC1uYXRpdmUnLCAnYnppcDItbmF0aXZlJywgJ2RiLW5hdGl2ZScs
ICdlbGZ1dGlscy1uYXRpdmUnLCAnbnNzLW5hdGl2ZScsICdwZXJsLW5hdGl2ZScsICdkYnVzLW5h
dGl2ZScsICdsaWJhcmNoaXZlLW5hdGl2ZScsICdwb3B0LW5hdGl2ZScsICdzaGFkb3ctbmF0aXZl
JywgJ2xpYnNvbHYtbmF0aXZlJywgJ2JpbnV0aWxzLW5hdGl2ZScsICdsaWJkbmYtbmF0aXZlJywg
J3B5dGhvbjMtaW5pcGFyc2UtbmF0aXZlJywgJ2xpYnJlcG8tbmF0aXZlJywgJ2xpYmNvbXBzLW5h
dGl2ZScsICduY3Vyc2VzLW5hdGl2ZScsICdsaWJwY3JlLW5hdGl2ZScsICdndGstZG9jLW5hdGl2
ZScsICdtZXNvbi1uYXRpdmUnLCAnZ2V0dGV4dC1uYXRpdmUnLCAndXRpbC1saW51eC1uYXRpdmUn
LCAnbGliZmZpLW5hdGl2ZScsICdsaWJuc2wyLW5hdGl2ZScsICdnZGJtLW5hdGl2ZScsICdsaWJ0
aXJwYy1uYXRpdmUnLCAncmVhZGxpbmUtbmF0aXZlJywgJ3JlMmMtbmF0aXZlJywgJ3RleGluZm8t
ZHVtbXktbmF0aXZlJywgJ200LW5hdGl2ZScsICduc3ByLW5hdGl2ZScsICdsem8tbmF0aXZlJywg
J2UyZnNwcm9ncy1uYXRpdmUnLCAnZmxleC1uYXRpdmUnLCAnbGliY2hlY2stbmF0aXZlJywgJ2dv
YmplY3QtaW50cm9zcGVjdGlvbi1uYXRpdmUnLCAnanNvbi1jLW5hdGl2ZScsICdsaWJtb2R1bGVt
ZC1uYXRpdmUnLCAnc3dpZy1uYXRpdmUnLCAncHl0aG9uMy1zaXgtbmF0aXZlJywgJ2F0dHItbmF0
aXZlJywgJ2dwZ21lLW5hdGl2ZScsICdweXRob24zLXNldHVwdG9vbHMtbmF0aXZlJywgJ2xpYnlh
bWwtbmF0aXZlJywgJ2xpYmdwZy1lcnJvci1uYXRpdmUnLCAnbGliYXNzdWFuLW5hdGl2ZScsICd1
bnppcC1uYXRpdmUnXQpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGV4dGVuZF9yZWNpcGVfc3lzcm9v
dCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBkb19yb290ZnMKTk9U
RTogSW5pdGlhbGl6aW5nIGludGVyY2VwdCBkaXIgZm9yIC9ob21lL3NpZGRodS9Eb2N1bWVudHMv
eW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4t
aW1hZ2UtbWluaW1hbC8xLjAtcjAvcm9vdGZzCkRFQlVHOiBDb2xsZWN0ZWQgaW50ZXJjZXB0czoK
ICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9zY3JpcHRzL3Bvc3Rp
bnN0LWludGVyY2VwdHMvZGVsYXlfdG9fZmlyc3RfYm9vdAogIC9ob21lL3NpZGRodS9Eb2N1bWVu
dHMveW9jdG8vc291cmNlcy9wb2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy9wb3N0aW5z
dF9pbnRlcmNlcHQKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9z
Y3JpcHRzL3Bvc3RpbnN0LWludGVyY2VwdHMvdXBkYXRlX2ZvbnRfY2FjaGUKICAvaG9tZS9zaWRk
aHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9zY3JpcHRzL3Bvc3RpbnN0LWludGVyY2Vw
dHMvdXBkYXRlX2dpb19tb2R1bGVfY2FjaGUKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3Rv
L3NvdXJjZXMvcG9reS9zY3JpcHRzL3Bvc3RpbnN0LWludGVyY2VwdHMvdXBkYXRlX2d0a19pbW1v
ZHVsZXNfY2FjaGUKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9z
Y3JpcHRzL3Bvc3RpbnN0LWludGVyY2VwdHMvdXBkYXRlX2ljb25fY2FjaGUKICAvaG9tZS9zaWRk
aHUvRG9jdW1lbnRzL3lvY3RvL3NvdXJjZXMvcG9reS9zY3JpcHRzL3Bvc3RpbnN0LWludGVyY2Vw
dHMvdXBkYXRlX3BpeGJ1Zl9jYWNoZQogIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vc291
cmNlcy9wb2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRhdGVfdWRldl9od2RiCgpO
T1RFOiAjIyMjIyMgR2VuZXJhdGUgcm9vdGZzICMjIyMjIyMKTk9URTogRXhlY3V0aW5nICcvaG9t
ZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5
LWxpbnV4LWdudWVhYmkveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvYmluL2NyZWF0ZXJlcG9fYyAtLXVwZGF0ZSAtcSAvaG9tZS9zaWRkaHUvRG9jdW1l
bnRzL3lvY3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdudWVhYmkv
eGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL29lLXJvb3Rmcy1yZXBvJyAuLi4KTk9URTogUnVubmlu
ZyAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBp
NC1wb2t5LWxpbnV4LWdudWVhYmkveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3JlY2lwZS1zeXNy
b290LW5hdGl2ZS91c3IvYmluL2RuZiAtdiAtLXJwbXZlcmJvc2l0eT1pbmZvIC15IC1jIC9ob21l
L3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3kt
bGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcm9vdGZzL2V0Yy9kbmYvZG5m
LmNvbmYgLS1zZXRvcHQ9cmVwb3NkaXI9L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by9idWls
ZC90bXAvd29yay9yYXNwYmVycnlwaTQtcG9reS1saW51eC1nbnVlYWJpL3hlbi1pbWFnZS1taW5p
bWFsLzEuMC1yMC9yb290ZnMvZXRjL3l1bS5yZXBvcy5kIC0taW5zdGFsbHJvb3Q9L2hvbWUvc2lk
ZGh1L0RvY3VtZW50cy95b2N0by9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTQtcG9reS1saW51
eC1nbnVlYWJpL3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9yb290ZnMgLS1zZXRvcHQ9bG9nZGly
PS9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0
LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvdGVtcCAtLXJlcG9m
cm9tcGF0aD1vZS1yZXBvLC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1wL3dv
cmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8xLjAt
cjAvb2Utcm9vdGZzLXJlcG8gbWFrZWNhY2hlIC0tcmVmcmVzaApERUJVRzogRE5GIHZlcnNpb246
IDQuMS4wCmNhY2hlZGlyOiAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL2J1aWxkL3RtcC93
b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdudWVhYmkveGVuLWltYWdlLW1pbmltYWwvMS4w
LXIwL3Jvb3Rmcy92YXIvY2FjaGUvZG5mCkFkZGVkIG9lLXJlcG8gcmVwbyBmcm9tIC9ob21lL3Np
ZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGlu
dXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvb2Utcm9vdGZzLXJlcG8KTWFraW5n
IGNhY2hlIGZpbGVzIGZvciBhbGwgbWV0YWRhdGEgZmlsZXMuCm9lLXJlcG86IGhhcyBleHBpcmVk
IGFuZCB3aWxsIGJlIHJlZnJlc2hlZC4KcmVwbzogZG93bmxvYWRpbmcgZnJvbSByZW1vdGU6IG9l
LXJlcG8Kb2UtcmVwbyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDg2
IE1CL3MgfCAxLjMgTUIgICAgIDAwOjAwICAgIApub3QgZm91bmQgb3RoZXIgZm9yOiAKbm90IGZv
dW5kIG1vZHVsZXMgZm9yOiAKbm90IGZvdW5kIGRlbHRhaW5mbyBmb3I6IApub3QgZm91bmQgdXBk
YXRlaW5mbyBmb3I6IApvZS1yZXBvOiB1c2luZyBtZXRhZGF0YSBmcm9tIFRodSAwNCBKdW4gMjAy
MCAxMTozODo0MSBBTSBVVEMuCk5vIG1vZHVsZSBkZWZhdWx0cyBmb3VuZApNZXRhZGF0YSBjYWNo
ZSBjcmVhdGVkLgoKTk9URTogUnVubmluZyAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL2J1
aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdudWVhYmkveGVuLWltYWdlLW1p
bmltYWwvMS4wLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2RuZiAtdiAtLXJwbXZl
cmJvc2l0eT1pbmZvIC15IC1jIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1w
L3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8x
LjAtcjAvcm9vdGZzL2V0Yy9kbmYvZG5mLmNvbmYgLS1zZXRvcHQ9cmVwb3NkaXI9L2hvbWUvc2lk
ZGh1L0RvY3VtZW50cy95b2N0by9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTQtcG9reS1saW51
eC1nbnVlYWJpL3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9yb290ZnMvZXRjL3l1bS5yZXBvcy5k
IC0taW5zdGFsbHJvb3Q9L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by9idWlsZC90bXAvd29y
ay9yYXNwYmVycnlwaTQtcG9reS1saW51eC1nbnVlYWJpL3hlbi1pbWFnZS1taW5pbWFsLzEuMC1y
MC9yb290ZnMgLS1zZXRvcHQ9bG9nZGlyPS9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVp
bGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWlu
aW1hbC8xLjAtcjAvdGVtcCAtLXJlcG9mcm9tcGF0aD1vZS1yZXBvLC9ob21lL3NpZGRodS9Eb2N1
bWVudHMveW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFi
aS94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvb2Utcm9vdGZzLXJlcG8gLS1ub2dwZ2NoZWNrIGlu
c3RhbGwga2VybmVsLW1vZHVsZS14ZW4tYmxrYmFjayBrZXJuZWwtbW9kdWxlLXhlbi1nbnRhbGxv
YyBrZXJuZWwtbW9kdWxlLXhlbi1nbnRkZXYga2VybmVsLW1vZHVsZS14ZW4tbmV0YmFjayBrZXJu
ZWwtbW9kdWxlLXhlbi13ZHQgcGFja2FnZWdyb3VwLWNvcmUtYm9vdCBwYWNrYWdlZ3JvdXAtY29y
ZS1zc2gtZHJvcGJlYXIgcGFja2FnZWdyb3VwLWNvcmUtc3NoLW9wZW5zc2ggcWVtdSBydW4tcG9z
dGluc3RzIHhlbi1iYXNlIGxvY2FsZS1iYXNlLWVuLXVzIGxvY2FsZS1iYXNlLWVuLWdiCkVSUk9S
OiBDb3VsZCBub3QgaW52b2tlIGRuZi4gQ29tbWFuZCAnL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95
b2N0by9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTQtcG9reS1saW51eC1nbnVlYWJpL3hlbi1p
bWFnZS1taW5pbWFsLzEuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9kbmYgLXYg
LS1ycG12ZXJib3NpdHk9aW5mbyAteSAtYyAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL2J1
aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdudWVhYmkveGVuLWltYWdlLW1p
bmltYWwvMS4wLXIwL3Jvb3Rmcy9ldGMvZG5mL2RuZi5jb25mIC0tc2V0b3B0PXJlcG9zZGlyPS9o
b21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBv
a3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcm9vdGZzL2V0Yy95dW0u
cmVwb3MuZCAtLWluc3RhbGxyb290PS9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQv
dG1wL3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1h
bC8xLjAtcjAvcm9vdGZzIC0tc2V0b3B0PWxvZ2Rpcj0vaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lv
Y3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdudWVhYmkveGVuLWlt
YWdlLW1pbmltYWwvMS4wLXIwL3RlbXAgLS1yZXBvZnJvbXBhdGg9b2UtcmVwbywvaG9tZS9zaWRk
aHUvRG9jdW1lbnRzL3lvY3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4
LWdudWVhYmkveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL29lLXJvb3Rmcy1yZXBvIC0tbm9ncGdj
aGVjayBpbnN0YWxsIGtlcm5lbC1tb2R1bGUteGVuLWJsa2JhY2sga2VybmVsLW1vZHVsZS14ZW4t
Z250YWxsb2Mga2VybmVsLW1vZHVsZS14ZW4tZ250ZGV2IGtlcm5lbC1tb2R1bGUteGVuLW5ldGJh
Y2sga2VybmVsLW1vZHVsZS14ZW4td2R0IHBhY2thZ2Vncm91cC1jb3JlLWJvb3QgcGFja2FnZWdy
b3VwLWNvcmUtc3NoLWRyb3BiZWFyIHBhY2thZ2Vncm91cC1jb3JlLXNzaC1vcGVuc3NoIHFlbXUg
cnVuLXBvc3RpbnN0cyB4ZW4tYmFzZSBsb2NhbGUtYmFzZS1lbi11cyBsb2NhbGUtYmFzZS1lbi1n
YicgcmV0dXJuZWQgMToKRE5GIHZlcnNpb246IDQuMS4wCmNhY2hlZGlyOiAvaG9tZS9zaWRkaHUv
RG9jdW1lbnRzL3lvY3RvL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNC1wb2t5LWxpbnV4LWdu
dWVhYmkveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3Rmcy92YXIvY2FjaGUvZG5mCkFkZGVk
IG9lLXJlcG8gcmVwbyBmcm9tIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vYnVpbGQvdG1w
L3dvcmsvcmFzcGJlcnJ5cGk0LXBva3ktbGludXgtZ251ZWFiaS94ZW4taW1hZ2UtbWluaW1hbC8x
LjAtcjAvb2Utcm9vdGZzLXJlcG8KcmVwbzogdXNpbmcgY2FjaGUgZm9yOiBvZS1yZXBvCm5vdCBm
b3VuZCBvdGhlciBmb3I6IApub3QgZm91bmQgbW9kdWxlcyBmb3I6IApub3QgZm91bmQgZGVsdGFp
bmZvIGZvcjogCm5vdCBmb3VuZCB1cGRhdGVpbmZvIGZvcjogCm9lLXJlcG86IHVzaW5nIG1ldGFk
YXRhIGZyb20gVGh1IDA0IEp1biAyMDIwIDExOjM4OjQxIEFNIFVUQy4KTGFzdCBtZXRhZGF0YSBl
eHBpcmF0aW9uIGNoZWNrOiAwOjAwOjAxIGFnbyBvbiBUaHUgMDQgSnVuIDIwMjAgMTE6Mzg6NDIg
QU0gVVRDLgpObyBtb2R1bGUgZGVmYXVsdHMgZm91bmQKTm8gbWF0Y2ggZm9yIGFyZ3VtZW50OiBr
ZXJuZWwtbW9kdWxlLXhlbi1ibGtiYWNrCk5vIG1hdGNoIGZvciBhcmd1bWVudDoga2VybmVsLW1v
ZHVsZS14ZW4tZ250YWxsb2MKTm8gbWF0Y2ggZm9yIGFyZ3VtZW50OiBrZXJuZWwtbW9kdWxlLXhl
bi1nbnRkZXYKTm8gbWF0Y2ggZm9yIGFyZ3VtZW50OiBrZXJuZWwtbW9kdWxlLXhlbi1uZXRiYWNr
Ck5vIG1hdGNoIGZvciBhcmd1bWVudDoga2VybmVsLW1vZHVsZS14ZW4td2R0CkVycm9yOiBVbmFi
bGUgdG8gZmluZCBhIG1hdGNoCgpFUlJPUjogCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZG9fcm9v
dGZzIGZpbmlzaGVkCkVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6IGRvX3Jvb3Rmcwo=

--gbC9QBSyEHijA8Bse5ap--
