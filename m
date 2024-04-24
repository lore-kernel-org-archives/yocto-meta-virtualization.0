Return-Path: <srr775038@tatatechnologies.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A6C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 07:07:43 +0000 (UTC)
Subject: I am trying to build the xen hypervisor on raspberry pi4. The image is created but fails to flash on the rpi4. Kindly help me out. #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: "Shivansh" <srr775038@tatatechnologies.com>
X-Originating-Location: Bengaluru, Karnataka, IN (14.143.64.66)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 00:07:39 -0700
Message-ID: <Prnc.1713942459026427900.Jl9N@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="xrgGb2Zd3sYisV2zQ73E"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:07:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8694

--xrgGb2Zd3sYisV2zQ73E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I used this document to create the image for my hypervisor : Xen on ARM and=
 Yocto - Xen (xenproject.org) ( https://wiki.xenproject.org/wiki/Xen_on_ARM=
_and_Yocto ).

The steps I followed are listed below:

1) Boot the machine with stable version of Ubuntu 22.04.4 LTS.

2) Update and upgrade using the commands =E2=80=9C sudo apt-get update && s=
udo apt-get upgrade=E2=80=9D.

3) Use the following commands to clone the important repositories: =E2=80=
=9Cgit clone -b dunfell http://git.yoctoproject.org/poky=E2=80=9D

4) Go the poky directory using command: =E2=80=9Ccd poky=E2=80=9D 5) Use =
=E2=80=9Cgit clone -b dunfell http://git.openembedded.org/meta-openembedded=
=E2=80=9D 6) Use =E2=80=9Cgit clone -b dunfell http://git.yoctoproject.org/=
meta-virtualization=E2=80=9D 7) Use =E2=80=9Cgit clone -b dunfell https://g=
ithub.com/agherzan/meta-raspberrypi.git=E2=80=9D

8) Initialize your shell to be ready to build using the command: =E2=80=9Cs=
ource ./oe-init-build-env=E2=80=9D

9) Edit conf/bblayers.conf, to add the source code layers needed:

/home/intel/poky/meta \

/home/intel/poky/meta-poky \

/home/intel/poky/meta-yocto-bsp \

/home/intel/poky/meta-openembedded/meta-oe \

/home/intel/poky/meta-openembedded/meta-filesystems \

/home/intel/poky/meta-openembedded/meta-python \

/home/intel/poky/meta-openembedded/meta-networking \

/home/intel/poky/meta-virtualization \

/home/intel/poky/meta-raspberrypi \

10) The conf/local.conf file contains instructions for the variables that i=
t sets. You should review and make sure to set:

DL_DIR -- set this to a local download directory for retrieved tarballs or =
other source code files

SSTATE_DIR -- set to a local directory for build cache files to speed up su=
bsequent builds

PACKAGE_CLASSES -- package_rpm can be a good choice for package format

TMPDIR =E2=80=93The default is a tmp directory under TOPDIR.

EXTRA_IMAGE_FEATURES =E2=80=93 to enable the debugging tweaks.

USER_CLASSES -- additional class to use when building images which enables =
extra features.

SSTATE_MIRRORS =E2=80=93This will mean the build uses the network to check =
for artefacts at the start of builds, which does slow it down equally, it w=
ill also speed up the builds by not having to build things if they are pres=
ent in the cache.

Uncomment all these.

11) Then add the following to the same file, or make sure that the values h=
ere match if the variables are already present in the file:

MACHINE =3D "raspberrypi4-64"

DISTRO =3D "poky"

IMAGE_FSTYPES +=3D "cpio.gz"

QEMU_TARGETS =3D "i386 x86_64 aarch64arm"

DISTRO_FEATURES +=3D " virtualization xen"

BUILD_REPRODUCIBLE_BINARIES =3D "1"

12) Run =E2=80=9Cbitbake xen-image-minimal=E2=80=9D for building the image.

13) It might show some error in binutil.bb file. Use the following commands=
 to clean and rebuild the binutils.bb file:

bitbake =E2=80=93c clean binutils

bitbake binutils

14) Run =E2=80=9Cbitbake xen-image-minimal=E2=80=9D command again and the i=
mage is built, and you can flash it on raspberry pi-4.

After executing these steps, I got the image. The problem I am facing is in=
 creating the boot and root partitions.

This is the document I am following to flash the created image: Xen on Rasp=
berry Pi 4 adventures - Xen Project . ( https://xenproject.org/2020/09/29/x=
en-on-raspberry-pi-4-adventures/ )
Once I have the image, I Downloaded the JeOS image, then opened it and save=
d u-boot.bin . Then, I Placed u-boot.bin in the first SD card partition tog=
ether with config.txt . The document says that I will get a UBoot prompt th=
at allows you to load Xen, the Linux kernel for Dom0, the Dom0 rootfs, and =
the device tree from a TFTP server over the network but I am not getting th=
e UBoot prompt. *I haven't automated the loading steps.*

*This is the UBoot terminal I obtained after inserting my SD Card in the rp=
i4 and booting the system.*

I also tried doing these things:

1. The 'rootfs' and 'bootfs' folders were merged into a single main folder =
and compressed into a zip file. Several methods were attempted to convert t=
his zip file into an .iso file, including using online converters, command =
line tools, the 'any2iso' tool, and the Brasero tool. However, after conver=
ting and flashing the .iso file onto a Raspberry Pi, no partitions were det=
ected.

2. In response to the lack of detected partitions, manual attempts were mad=
e to create two partitions for Root and Boot using the command line and GPa=
rted tool. However, an issue arose when trying to load the 'rootfs' and 'bo=
otfs' files into their respective partitions.

I am a newbie, and I really don't understand the file name systems and thin=
gs like dom0/dom1. I am trying from last 2 to 3 weeks to flash the image bu=
t failing at it. Can someone please guide me what should I do once I have o=
btained the image through bitbaking?

Regards,
Shivansh

--xrgGb2Zd3sYisV2zQ73E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I used this document to create the image for my hypervisor :&nbsp;<a hre=
f=3D"https://wiki.xenproject.org/wiki/Xen_on_ARM_and_Yocto">Xen on ARM and =
Yocto - Xen (xenproject.org)</a>.</p>
<p>The steps I followed are listed below:</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">1) Boot the machine with stable version of Ubuntu 22.04.4 LTS.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">2) Update and upgrade using the commands &ldquo; sudo apt-get update &=
amp;&amp; sudo apt-get upgrade&rdquo;.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">3) Use the following commands to clone the important repositories: &ld=
quo;git clone -b dunfell http://git.yoctoproject.org/poky&rdquo;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">4) Go the poky directory using command: &ldquo;cd poky&rdquo; 5) Use &=
ldquo;git clone -b dunfell http://git.openembedded.org/meta-openembedded&rd=
quo; 6) Use &ldquo;git clone -b dunfell http://git.yoctoproject.org/meta-vi=
rtualization&rdquo; 7) Use &ldquo;git clone -b dunfell https://github.com/a=
gherzan/meta-raspberrypi.git&rdquo;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">8) Initialize your shell to be ready to build using the command: &ldqu=
o;source ./oe-init-build-env&rdquo;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">9) Edit conf/bblayers.conf, to add the source code layers needed:</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-poky \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-yocto-bsp \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-openembedded/meta-oe \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-openembedded/meta-filesystems \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-openembedded/meta-python \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-openembedded/meta-networking \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-virtualization \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">/home/intel/poky/meta-raspberrypi \</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">10) The conf/local.conf file contains instructions for the variables t=
hat it sets. You should review and make sure to set:</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">DL_DIR -- set this to a local download directory for retrieved tarball=
s or other source code files</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">SSTATE_DIR -- set to a local directory for build cache files to speed =
up subsequent builds</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">PACKAGE_CLASSES -- package_rpm can be a good choice for package format=
</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">TMPDIR &ndash;The default is a tmp directory under TOPDIR.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">EXTRA_IMAGE_FEATURES &ndash; to enable the debugging tweaks.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">USER_CLASSES -- additional class to use when building images which ena=
bles extra features.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">SSTATE_MIRRORS &ndash;This will mean the build uses the network to che=
ck for artefacts at the start of builds, which does slow it down equally, i=
t will also speed up the builds by not having to build things if they are p=
resent in the cache.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">Uncomment all these.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">11) Then add the following to the same file, or make sure that the val=
ues here match if the variables are already present in the file:</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">MACHINE =3D "raspberrypi4-64"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">DISTRO =3D "poky"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">IMAGE_FSTYPES +=3D "cpio.gz"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">QEMU_TARGETS =3D "i386 x86_64 aarch64arm"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">DISTRO_FEATURES +=3D " virtualization xen"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">BUILD_REPRODUCIBLE_BINARIES =3D "1"</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">12) Run &ldquo;bitbake xen-image-minimal&rdquo; for building the image=
.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">13) It might show some error in binutil.bb file. Use the following com=
mands to clean and rebuild the binutils.bb file:</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">bitbake &ndash;c clean binutils</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">bitbake binutils</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">14) Run &ldquo;bitbake xen-image-minimal&rdquo; command again and the =
image is built, and you can flash it on raspberry pi-4.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">After executing these steps, I got the image. The problem I am facing =
is in creating the boot and root partitions.</p>
<p><span style=3D"color: #000000; font-family: 'Times New Roman'; font-size=
: medium;">This is the document I am following to flash the created image:&=
nbsp;<a style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-seri=
f; font-size: 14px;" href=3D"https://xenproject.org/2020/09/29/xen-on-raspb=
erry-pi-4-adventures/">Xen on Raspberry Pi 4 adventures - Xen Project .&nbs=
p;</a><br />Once I have the image, I </span><span style=3D"color: #000000; =
font-family: Times New Roman; font-size: medium;">Downloaded the JeOS image=
, then opened it and saved u-boot.bin . Then, I Placed u-boot.bin in the fi=
rst SD card partition together with config.txt . The document says that I w=
ill get a UBoot prompt that allows you to load Xen, the Linux kernel for Do=
m0, the Dom0 rootfs, and the device tree from a TFTP server over the networ=
k but I am not getting the UBoot prompt. <strong>I haven't automated the lo=
ading steps.</strong></span></p>
<p>&nbsp;</p>
<p><span style=3D"color: #000000; font-family: Times New Roman; font-size: =
medium;"><strong>This is the UBoot terminal I obtained after inserting my S=
D Card in the rpi4 and booting the system.</strong></span></p>
<p><img src=3D"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX=
1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWF=
laAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAA=
ChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMA=
UgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACS=
gAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9=
AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAAS=
QBuAGMALgAgADIAMAAxADb/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkK=
DA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBA=
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCADHAZADASIAAh=
EBAxEB/8QAHQAAAQQDAQEAAAAAAAAAAAAABgMEBQcAAggBCf/EAE8QAAIBAwMCBAQEAwMIBQkJA=
AECAwQFEQAGEgchCBMiMRRBUWEVIzJxgZGhFjNCCSRSscHR4fAXYpLS8TRDRWNzgqKywhgZJSZT=
cpOUxP/EABoBAAMBAQEBAAAAAAAAAAAAAAECAwAEBQb/xAAxEQABAwIEAgoCAwEBAQAAAAABAAI=
RAyESMUHwUaEEEyJhgZGxwdHhcfEFFDJSFUL/2gAMAwEAAhEDEQA/AOfKGsqbpUJHloYWOXk/6u=
hO79brTtq/V1rpbRLWQUlQ8SzpPxWUK2AwBGQDjPfv31YcMdNCqwQIqqvsMa54rdgbl3DeL5cLb=
QM0FLLLJJK5KrxHIkgn3xj+o+uvpOn1qlAAtNyvm/46izpbnNe2wVrUHito6WEmLazLjsc1Ayf6=
akaXxgUEP5km2JlCn/DMpP8AXQ90g8F3Ufq90/TqdapqRLC0k8DMhaSdZYpIk4eWBkljMMY+Stn=
HbJdV+AHddvtxu9w3ClLSiqSjLTUkiYkdeSjB74I+f3GvPZ0rpFYS0g+S7qnQOiUTDweOqkqfxz=
2imhEMmzqpyB2YSr/v09pfHvYIFBfZFW5Ht+coH+s6GH8CN4gqp6Kfe9vjmp5WiljeJwUYHBB/i=
CNew+BC81EqUtLu6iqJ5DhI4oZWdz9AACToud0iLhRFHoUwCeaL5fHhtmrjAGwKxTkDIqEOoG5+=
MLaVyVnl2XWKM9281Sc5/fW9H/k7d/Vr0SRXanhFwqpKGBqiOWIGdE5FDkdiR7Z9z21HVXgF3tS=
WKK/1V4pIaeadYPKkDrOhZyiloyOQUupXJGM9tTbVrA23uFb+r0eMjz3qo29eJXYl6pTRyWO5Rf=
RgEbH9dV7dt97QuoURS3FRniAadD3P/v6P4fBRuCqqzbqfcNNNWq5iNNHDM8vJc8hwC5yMHP7al=
6D/ACfHUe5fh4jrYIBc6mpo6ZqlJYQ08CcnjJZRhsZwDjJVgPY6u/pXSQMLo5JKXRuizLJVR0nU=
bbNHCIQlU5TsGMaqf/mOpq19adtW+SOX4GeVomDLkADIOcnB79/4aPLd4CN63BI5Er3VZJDECaG=
p/WM8l/u/cYOR79tTlN/k4t4zvGh3JTIZX8teVLUjL98r/d+/pbt9jrm62qwqxp0HBCtm8SOyKa=
nkgrNu1f5zKplh4M6gMGAXmcDuM/7tEs3i02HNSVVKNp3bjUoUeoLp5gByB7HHzye3v30T0P8Ak=
tt8VccM53fbI45pXhVnSZfUgyw7oMYGf5H6anIP8k5viSKSUb9sH5fHmglkLLluIyOGe5I/npf7=
dSblL/ToO0Kk/DP/AJQDYfRT8Qo6nZl8uMF0aMemaNBFxGMgHOc5Hz10gv8AlXOjAiEk2ydyLkd=
wjwMR2+7DXOK/5I/fkBCvv+woxbABllySD3/waef/AHS/UIKCd+WXBIAPnS9wcd/7v7j+eove2o=
S52a6abTSbhZkhjr34s/D31Pu9Xe6ej39T1lXL5kqT0FG0WfkPTUL7AtjIJ7n66ox+tHS6nmCx0=
d7Ea+oA0sKkn74kPb3+eujqr/JG7/dfMbe1kOSACaiUZzjH/me/uO/31EVv+Sa33TMVfedi5Duf=
89k7j6j8jVG9JLRhBUHdGpl2JwKpd/EtsxZZZKWnuUXnRlHxToMnuB7P8h2/n9dCtX1i2TWMXeS=
vUg5B+HX3Jyf8X11fdX/ktN50hPm7ps7ADORcXH/+fQ5cP8nLuK3sBUXqlYHPdLkMdjj5wjQPSH=
uUxR6O06qqv+mjZaR8PPuJ5H1fkL3Hz/xaay9X9jtGEMtxJznkYB7/APa0b3HwN3eiV5DXF0Q4J=
WtjP8sxjQxXeEi70xZRNNkEDvUx/wDd0vWPKIb0bioUdUdj9s1dbj6fDj/fr09T9ikL5lxr5Agw=
oFP7D+ekavw1XimPESyE5x/fxn5ajanw/XqBuIds/wDtozoY3jMKop0DkVKydUdiD9D1z/T8rH+=
3WtP1V2JyYSxXIBgfUIkPf/taHpuh9+iViAxx/wCsj/36j5ukG4owSIX7fVkz/wDNrY3lMKNHii=
OfqdtcnEUdUwHsWUAn+umFX1FtNRC0SCReX37DQ5L003DHn/Nyce+WT3/npq+wNyKe1Ex/95f9+=
hjedFQUaecqXTdVOgKLUsVJJ+mtv7SWtowGkHPv31BNsbcqnBtz/wAx/v1qNk7mJwtrlJx8sa2J=
w0VOrYdVMm9Wx25NUdidKrfLcYhH8T2Ukjt/z9NQP9id0YyLROf2XW39hN3H/wBB1X1/u9HG7gh=
1bOKIobzaeIWSo7ZyPr/HU9RbvscKxxmqYAfqPv8Aw0Bjp7vIjP4BV4P0j1uvTnezZA25XEg4/u=
TrYn8EppsdqrS/trtBkHC4shxhuUZyf9mtjvbahbMd4XC9gGRh/s1WEfS/fMntt2u//gbTuHo/1=
AnPo27W/T/yd/8AdrYncFI0aerlYP8AazbsygR3Sm5f9Ylf9encO4LUiEJeKAfMn4hdAUfQfqXJ=
+nbtZ/8A15P+7pdPD51VkP5e1q1+2fTSy/8Ad0Q9w0QNKmf/AKRrJebY7/l3Wjz7g/ELnP8APGs=
e40PPlFeKZuQBJaZAeWO/YMfrjOg0eHfrDnCbGu8h9xxopv8Aua9Ph86zRjJ6dX4gfS3zf93W6w=
6hDqGHJyOYqqklIQ3SlHfHedMf69Glm2vFWRLLFf7QWPuGr4lb2+5A+eqT/wCgXrLH79N9xk/a2=
z/93WydEerykk9O9yD6/wD4dN2/+HTtrAaJXdFDsnLpW07JrvM5R11okAIwGutMM/8Ax99WRtrZ=
93ijdTLZYwVKo0dxpXIP1/We37Y1xQvRzqygydgbiHf3NvmH/wBOlB0r6nx9n2XfkP3o5R/s110=
+nBmii/8Ajg/Ny7oh6X7nrBJPPeLVM4ACK1XAM/xD/wBNMYegu7WqGEj291ILYSuiH/1dvfXFK9=
NupCoOW1b2B96WT/drYdPuoi++27wCe39w+rj+QYTcKf8A5oGRXc0fQTfVOCbSBJyYsyCpiIxn5=
fLONOqno51HrlWOTbEzxRN7+YrvkfcHB1widjdRYwR+A3hR/wCyca8faPUZBn8GvK/XEb6YdOpx=
r5fax6ABqu7Kzo71BnA//KFUqhcZKcyR9Pn31DVHRne1IWqKjYl3mBweMVK7tj7ADXEsu2+ocYL=
Nb7wB8sq+m7WvqDCAwp7wB9cPqbuls09PtMOhHjz+le61LuEk9gcHkD9tVvVT7/mlvFr23b4Zrd=
FVzTPJJN7cTyKnk4A9/wBOBnGe576K7NuSwy0UYlvNHG69uDTAEDVf3rdN4sF/rJLTb/PpJaqdm=
kVnMdTygClTxPcKrg4HvkE6f+QqBzGkFL/GU3U6rgV014Hb34hB06iqunNusVXYrJWVtMY3qP8A=
O2mneklcmISqSF8mIqwXsGk9/lce4Lj1Bu9vvn4xR2K5wmsoJp5org1fIkzIUhMDtO7SclDBs88=
AH9OuTfCT1R3ltzbybY23apBBBuCG9y1UZmImljjCxwSqp4NHn1YYZzjGukqDfN82Dea630uwKW=
01VLcqGZ6Uid/h5qdmZVOWJJfmwOT2+Xca5+gEtpaT9/EeZXd/IFrqgEnDA9B7z5J/RU93vG5BZ=
6WgSmulwnCR0RVaVRI/sgDYVB3wAcDRZZ9q9ZdpXei3XaNt0sk1NKIo8XCCVWEiIpP5cnLhxnj9=
anA5qcjQed6boqd10nVaqsFTOLdW0kY+JllZDKq/lozt6u/H9tFlz8RHUS01dTZ63aVNDNTVXlV=
KTTyzlpFWnjIZsnlJwgZOWc/nOffXRUL3nCACIuvNotpM7byQZtuE4uN060WCmXfl42Pbq2lpLk=
txpbjJVyVaxzPHHTKElWoYyAhYcZZjjBGBof3T1X6g9QKWHZ95t1pV5Kmlo/KZHjwYeCrCwkkKD=
lIiszMM5yMhe2o5N5bi3DbF6c7V2ilLb3pfKitkdXK4HlzrUmVg5HJ8IwJ7dmOMdhrKLp51J/Gq=
K7p08q5DNWxV8dMkqoJlYrKqozMzcCGUBjy/UM5OlDWsaS4DFp6jXiqlznuApk4dffkmlgr98bG=
uUm87Rt1M0tdVWaWONvRHUPFIHjRY25jiochlOBxHf2zKQ9S99WSa37ur9qWyokN0rbpb66plqJ=
ZKaZ1SnmRm87kCPKjH5nq9PY4Ol7d1RvuxL3W2+q2DJT10G7jueSmqbiymIvBKggP5eCpSoLcx2=
I4nGDppuvqtcd6bRl2dLtVKMVFTFXSVS3FmdqiMKvJh5a8kKD9DEgMeYPy0XML33bbj3X9o80ra=
jabCA+/Dvt7z5IltniB6ihLYJrPTSpRhfK8pqxI5UDOwJRZOLNyJPLBPp7YxqZ6f9Y947ctpskY=
pql2jeCaesMvn4dwTluYIYYAB+Wh7p11nodv023Nvbn29Wx0tlqFlN0oqrLNGhqSqGDh3JFVKpI=
kHshx6SGgZ92U24q2quq2WrpbjXXH4lpJaszgUqxKiRscDk5ZSzMQMnGB3wObqgSWlsbKo6u4AP=
D5P6XQm3t5botdNDf621W6SKrqpa+nmmqGaTEiiFwoMnNh6McipwQf4G1v3deSjX6ooAIaiseZ5=
UJVXZgFA7d8Dvg/U6oOy75K7Xi2rVWmorG82IpPNXckhRZjIfKj4Exu3JkLB8YY+nJzo7tm/Kqb=
bkm16e3RQU8khVZTUGRo6cVBmSP2GXD4BfIBUY4g+ocrqfEJuuEWdpPirxtu6LrXJ8QLWzLPKBl=
ZWKg5H6QfY5wOX3x76eDeDTxKgh9IIwS5JKjGQe3ckr7/vqtLFvQ2yjpoZbUk8tKyNDMZgMIJRI=
RjiTk+tcgjsR2ONEEe+ImpIiIp2qTPyaLn2VAYjzJKBWcmN/bAHmN9cajhurtrWnEiufdbyRYkg=
XCkFPURhQVOD9f0jv2+eoK73Zqtpq0wsI1IjBHcKcdsn6nH21E1W4DNXfiXCRUDoxiaQFjgAHvj=
54Pvn+Ooy9biWupapEFTG88kUiRc18mMoMMoGc47nHbOAM/PQwwkfWxAyUz3JceaS+TDJO0ZQel=
CePI8VHb6thR99Vpu5r1TJUVD7fuPkU6s80vw74QEj1E4OP0/yGiGv3A1DHUQOlU6T1lFUqaaXj=
KphkYlQx/TlXbBHcMBoavXUu30zVxFJepVlpZI1iQxwxyy+WVEnoY+R3Y8wmRKCQwHfQuCpNZTe=
O06Cqs3VV7htMskFfZrjSCGI1bRywOoWPmU5k4/RyIGfr89V5eL3cHTkk8oUrz5dx8gfYasK77r=
stsvF5qrTJuGZbtarjQxrcJl4o9ZOS/ZScIqSMTj9bgMQM6q+5SQ/BiJ5AZcJH2bBIwwyO3bGBk=
/UjXQ0gKT2tEQoG5XKtZwki5H0wD8//DQ5W1srKcxhgB/oj6DUpcZlVuYf3XBJJPbI+n3zodrah=
1U8WAyMD3H10MSowiE0q7m/HiYUPYHBJ9u/t9NQdXdXYkFPc9v2/jpzW1JfmwCgr88/f/jofqqr=
AOVX20uIroAlZPeZ/wBWAF98cRpqb1Up7GPH1K+2mlVUDGeJPfPZvbTGWqxkAEd+3fQJV2tUwb7=
WkFTNG3zOOwGtRfK3vmVH+WPpqB+L7k9zgYGe+tPiQe5wc/8AP+3QLlQM7kSLebi3ZWVeI7Af8/=
bS8d6ubN2qkCnuw5/TQqlQR3yRnsdLrVIBwAPv9dEOQLBFwiqO/XTjyM5HH2w2R/z21I0W4LmME=
zEfTPuNB0U6tjuwwfsdSFPOMjiSfl30weUhYDojy37huKsDNITkdyx0Y2O+VTkOzgjOQFJ9/wCe=
qtoKtSQwbuuB76MrLWuWUgDJ7Zx9dVDzquWowDRXNYrpVOPNPqJH1JwP56tHbVZKyqrkhkUZ9Xf=
VHbdrJMgqTg4BGSANWnt64kpGZGJbH8e+qSSuIgNNld23pXOAXAyPbPtqw7PUAIOOc6qDb1yBVH=
YNkgD+OrCs1yVlX1HOBntjUnNVGPVl2+pwoHbtogoqle2SBoCoK4Ljn30QUlaoAAOoOauxlSUaw=
VEbd+2niTQkYwp/hoUp7jge+NO47mc9iNJhVw9Ewmp/bgn8hr0y0x/80n/ZGh8XMe3LXj3TA99D=
CmD1NyPSEHMMf/ZGo+pW2sCHoqZv3jB1Fy3b76YVN2z9tNhQNROq2msjAh7XRMPvAh/2aHbha9t=
zZMlgtrAe3KljP+zXtXd0X9TfvofuN9jVWIcfx1RrZUzUAXwdQ8gyhSX9yftqwbVuDcVDc6ew7d=
2/VXCeOk+I4Qzuv97BAOWAMYHAYz7lgfcDVfU0pTzDgEjuT89WzaeotfaK2lpLRs2e9TVVBRFjT=
syyYjpUBUAI3+hkn6Z9vcK8nDZdLYlHvhE3Z1KsfSnflp2psWpu9tkmElRcae4mI26VY2JZUX1O=
eCMSFIyqsG5DsL4pfF00y3ySr6aw8r7X01zq5o7m6y+dG0TjDvExVOcPpUYwrsDy7EUV4K+pe9O=
m1h3tPtbo/etzpFVx1VXPDOywUSxwVMZSdBCxYYmdjhkP5f0zqzN2eJmme17p2hUdLbpZpr7boK=
eOKa8ANSsVcrKyinUurRyJhTgduQ7kEU6MQRDm68e9L0qQcTXacETjrPubqF+Kbdq7XcLrJuK7U=
tXaoluRD0rRyNwh9KATni/EEhTyCsc4C6sHbviLWDclZDWbQmo6K5XyWsqVlrjO9K8j03NQvlpy=
ZWp5OJ7EGX2ODypLo51obZmwqqyPs253SnN3pKyW4w1giFKySRusKkwvwEvlFXHL1gAdsHNob26=
8TbltsO27zsO4beulK/mVYFUkPxLO0EivNEYAxZViHlkFcCQ4yDg9OLGYLea4zLAHYr/j8JS/76=
jt/XK478oLVWT01JMKQ0VexgqOC0y08ik4PBuzkEr2OCV9xqZoOvUBvVFX/wBgqqpaiqKE0lMb2=
HVPho4ooyvKAlZWWJQxXirZ7pkAiO23uPZl26np1Cqr7NalrL0K6W2vSSVTcWbLoJI1w3LLDHH7=
HOpneXU6ivUdLJDtS72emiqkhikR4lhrWppITJM/KEH4jMffBBXzME4JBZ+F7owzYDh4clKmXUx=
ixxcmM/Hmgnee44d27pu+5LntWrobjUV9NFLHJWH8uGnp1geB18tfzWMasWHELggLjGGM1FV01k=
a8/wBkLrT0k1wLU9zdmelWD1L5JbywrPy4+rkP0kce/abvV3gvk99mgpqyGC8X6S7or1v5cat5n=
oaIDizjzBh8jABGDnINdh9Xtv7L2zBti4bamroYjNNNMIIJeMzyKUKhmBdFVeRQlQXC+2OWrPqu=
YBhHd4LmYxtQnEY8NVUSzU8rrFTHzpZisccaAsWYnsAPqTpxSTyLU/hwp5RWCb4c05jPmeZy48O=
Hvyz2x9e2rg3V1T2Fc9m2qsttItBdE3NSTywwWaFZ5KaGZpZJeQXywzYizGJCPYFjltMKDrJtq0=
iCazbdrJbhFulrxC8tooeZpHqWkeMyetw/BioAzg/4sYAi7pDi2cO778VQdGpgwX7tvwQjabrR8=
l9fAAZYO3cHPftqwrHUibjHTK8zMO0ca8icD6D3/wCGlLF1U6colDT1e0JahYLjJNPPNtyh82qL=
TM7ZZXVU/Lfy/KCkD3znGEdn3SoS/LuKtMNNLLz80UlGojHOIoSIVZVAOe4BHzxqLnkyYyS4GtL=
RimeSMbfWsmIpIZkbn5YUoRhvfj3+ft299T9JUAoS/IBDwOc9mHy/fUnt7eljo6UUtFaKtVDCID=
BCx+vm1SqlzhySV45zgL6+2NEAv1HLbPJjo3rJYniVfilOJeLITM45fqbgRg5Pf37ka5S/iukUm=
R/pDLTMqcWRu+FyRgA/8f8AbqNrnRkcOeIAzn5+3sf46se7VtFV1UlVT1NSPPqYppI2iJHFWj/Q=
p9Kn0Fifc8VHYE6Gb5za80l2paQt8LJTO3mJ/emMKWcg5Jzg++SfnpcdpQdRAIGLXZVVXeshVgF=
fsZAQQPfuDkar2/y0sTskkzDmcA/IZB7dvf31fm+txWO9bfhoJrVElUtTRT+UsMixQlBGJgoT/B=
x83I+eBjvjQC28NtWzblbYZbHFTUl3v6w1kCCplQWwo0c88RfuGKkFFJJVgGABAw4cM1I0WgxiC=
oa+SU5dmEoJKZ5dh2AHbv8At/PQNcJ4VAYSgkPnBx2GT/v1cO75ekFDty8T01jprnfAyU1LTU9X=
cKeJFYTfnqZAefHjS8kYjlymAI9JEHuWfopdqLet2nNpp7vPSxzbeiovxBRHIFkHlurAJzz5Z92=
QYC47swIeLd6bqAJ7QsqKvNWF8zDKW44A9h+n2/pqBrZSe4HJSCe5+ef2++rk6cbute3Nn7osd4=
rLfQS3LMiVRYi4HjR1IjjhBp5EZGmaMNl0YHgR7EikZ0ljhQScskfNvbtoAzMp8IbEFQ1fKUB9P=
3+udQNbJnvg4/hqVuDN3wB29v8An+OoCtPHIIxj56xKuxM5pe+CO/01HSyg59/5a3qpSAfT3986=
j5pWwcfL5aVdLQlXlHI4JB+mNa8x79yP2018xmOT89YZGHyP7aBlUCeiTPYsQPb20qkgx2c/y1G=
iX7EaVExA7Me/bWAQJUtFLnHqGc51IUtQCewxqBhlbOf9epGmnPz9vtpwpuKJqCYZ5Bx9dFlqqW=
yp5jBP00C0U+WAU4I9/nomtM2CMAZbuPpqgXPUyurc2uWlGeRLnBJz2x9/vq1dtTrGghUFnIALZ=
+edU5t2p+HjVC+GYZ4++dWDY7n8PwccvUcnAI+XuCNdDcl5lTNXDZ7m1LgM4HEdwexJ+x0c2e9x=
kAFjkgY+2qps10FdAY2YdxgggZz/AA0/pbpPbZuM0hUZ7ZPuPsNbCkDoV8W69pgBM/uTogo7yAV=
9Qz++qQt26FCeuUg+2B9NEdLulCqlahgB+ogY/bSlis2oFcNPe0bvyx++naXdD28zB+mcaq2n3I=
CB+afb2xp6m4EJAWXvjPvpDTVRVKsn8YUdzIBj66Te9L7F/fVevuVcnlID7Y++k33GvcFh3986H=
VoiqUezXtSDh/b76i6u/KfZ+/z76DKm/wASxkrL3H39tQNbubnlmk/T++nFNA1UZXG+qcqZsD99=
Ct13Gue8nYD66Fq/dQILEniPn9NB173OGLIsnE+4P/HVOrhT6yV8wDxijxkHR/Zdx3ayUlCafbV=
zuFMYlleWmZkCP8O6rghGXkqhnGQf05x2yK4mjZVJc+/y0f2re0WzrdamnpKiYVtCSRDKqArieE=
8iVJJHIkD2z3Oe2PPcbL2WmCrF8Mu9NxbNj3xbqLppuS8S3SpeiaGnlkxT1BhqAkcq+Uz+anrcM=
pST8pxniWGulj1Z3VDFum67w8Lu9pau5Wq3m63Grjkc0a00BVZ1ElNiGPlEXBJ9xJliBgcxdAPE=
Vadn7i3ddbvtmuqTdr8Nw0q0dasRhmEdXH5bMynIxVk8gMgoO3fV/Q+MjZSWq+0/9lNy1FVdbRJ=
b0qKyqppHmkZKxQ8zKqhXAq15TRqHkKsW7scrSBm43KrVeIgHcJRusm6uqdBvS323ppuOexbmrY=
ZLJBZKVFSjamaSUQy+VDxl4pKuSAGKxICceoW1ZetdqrbtcbneujV7a2XC5UNVNW3CgEkVJH5ME=
AaRljYhWlgLjAPfsATqifDD4h9sdHtr3LbV9td+rGu9whqnmoahB8OkIDII1Zl9UjqEk9sxkjv7=
asfd/Xmy7t2fRbTvFm3Tt662uCR4YqCOCigq2qARxqIwRiJYuDKAp5lnHpB5mzAXuuIudwuR7gx=
sg8E86hbhjtnWqove2IahIbYbd5MctE1M8jx08Qk/LdARzcOcle/LPz1YFk62bJtt4nprlsy9Xm=
Oe81ddLTXK3Uhmgmlek7IAexQRVA4DHL8sMcklKh3Puy2bt6o1m9LBLeIqOrqaWWPlChrIzFFGr=
lUWRlJBQlfV9PbRZa+omzqHq1W9T6KG+3BJrutwipaqlhhJSTl54fEr4ZSVKkHv3zx10vGITFwB=
6R7rhZULSb2JPrKfwb2ssfUt95VO3pRZTUeV8P8AhkUJDCHgW+HLNFzDAv5Zcgn3PcnRjbOpnTy=
FadLrs2puMUVQjT8tvW6I1K+aDJMSj/luU5p5S5TuDyB9me9+t+3947Ruu36Hb9wgmqRBBTSTIm=
JBGYSaqQiQ8ZGETDjhz6l9fvmvILhTqqx+cpbjnudEUxUEusUDVNF0MMjPzVg0vUTYlVV0EV82v=
UQ2ahusVwFBBYaGRJ1ekhSpVm5KUBmWZ14k5Dp+kKFEY+7tg3Hb1Ksu2Utd+hrYJ/Nt9ljiSN1r=
FkaoWQSFwppwy+QMqHPYYwQJipppGEXnIHdh2J0ukcKsAzr2bAOQc6V1MERvd0o6S+ZjewjS03/=
an4rcqm4CWuo67d895jpaiiYxfDvBUKjuAffzJI8r74X5+2iequG26qiSmslmtQnmrJJHnho5qZ=
qeMMhQKCxDA/mgg/Ir2GABXdrkpi6LyQMO3uP56MLbLEoiXkEz3+50j88W93SdYS3DG7fCPLPGR=
xIGCFHt8jnvo1tiRyqvbBwAe2Md/poJs8sXFG8wD7e+T9NF1sqUBxyw3f27/wAP6646hXTTIGaI=
UosIcEYXsPn9s6jq+EujgQhsL2+/Y6dNUHh+vAB7nOmlTUqSysVJ7Zx/HUW4gbroqFhbZBd/oY3=
DAwEt7ZVc8f8AnA1Wl+p40VkK5Iyx5qB9/wDaf5ata95XmWDcMKM4/pqtdyRkh42fPoGRjHbH21=
0NK82p3KoNz0oVjHwyD9R9z9P3HfVd3KlgVn5qCM++Bgdjq0tzKgDZ9C8S2Tgdhg/6h/r1V95qY=
m5BeTF2OBnIHf6abEptEoMv8lMXLpAg4D5/uNB9zdW7EcgPrqevFZFhsN3Hzzk9hoTuE6LyAYEA=
YH9NbEuxjSoC4Sd2B7N9ProerX9yD2+mdTFfOvEHOc/T+OhytfOQPnoSuxgUfVOTksD/AD1Hu5I=
wD76XqHYsV0zDZbJAHyGsrtCe0hUOqsuM++frresQKCQCNM0mCsATn699Lz1gKkMwKAYUH30UYT=
MSN8s6WSQg989vpppzI16JCe+TrBMQpGKb1ZyR9O+n1PMynsxzqGjlUkersNPYJgpHcn6jTAqZC=
JaKoJwxfsPb2zoktdUgZRnIyPl/znQVR1HEqc4/2aIKGrwOzaMxkoPCtW015ZopFYY7DJ1Z23q2=
JPLBBbAyzH/Z21QtkvJgdUkb0Ht76si0XxhDmYsQo9Sg+2r03LhrU+Ct87mprTTpNPUxQiUexXu=
APf8A5xr2be1jvNLFFR10bVIPZcEcvtk6pHcV2FXJHMk7+XkKxY+32/1a1s9zp6bzKpmeLywW80=
9wx/2d9UmVPqIF1d9Fu/hGI1dmAbBAHf8A5+eiCj3ohVAJH5H6k4zrm+l3m8TtiVe+eWfbv7al6=
Le7IvJJ+wyMZ9h99EOGSHUOXSVPvSIghX5svzVvbT2Hd8bD11DA+579vtrnSm3u4B4yAs2Mjl3P=
8vtqTp95zcxKWTkcDGfYf8/XWS9WQF0CN2Kyswn+4BbsdJybpPl8g+cnvhs9tUlDu1uIV6gHJ+Z=
+WpBNyvKSgYD59z7DH+rRhLhIVnz7qWRDGZcAHt+2oap3MmWYyZXuSOWgV7zKZATOVDAgAdu2m8=
l0Mmct8jkg9v8Ax03csim4bjlmjby2CkD+OdCldd2kj5PIOZ98nv8APUfUVp7kNy7YHfUTUVEjM=
ScAD3+RGs5xTALjippgqMRKrkd+2jGg3TY9s2OxS3WzfiJqbfmMFYyIStdMSRyB9wCvy7MTkEDQ=
CEkWoYtgDB9vb21NbkoKyp2vtapp6aaVfhqilyilsuKmZyO3z4uD/wAnXmG4XutsVaHhp6w7H2R=
uDfM+69mm7wX+BvhY46WlZqZ+bMCOa8UHcZABXGQVPbHQEfiV6ETT7pkqel9ZUR3u3vT22OS029=
RaC3mFYouBUuqO0bCVyzEKV4qDnXFnTfbu4a2718NBYrlUvEsaSJDSu7I0jhUDAAkFmIAz7kgDR=
vHa7tCqvNaq2NZIDVoXgYBoAxXzR27pyVhy9sgj5azGtKNWo4WXXVd4k+hN6N4pqfpHLBHcqGen=
h42S3q0UrR1ojYFWyuGmozkHP5TfT1G21uufRK4bjqW3bsiruVLc0t0STXC00qmF4qBYHLMJGZI=
/Ojik9GcLy9P+FuLbDModQXTt8vb+WrR21cbdS3Cgqq5EqKenqYZJ4WQSCSMOCylSRnIB7ZH7jV=
xRbEibb9lxPruBg73Ku7d+59nWvrPbdxbKq6WezWr8Mnd7ZTxwCSWMK85VUwvIty9jjPYHA0cXP=
qh4e7jV09woNi11HUpVCereW0QulW7zQPI5QVHoHGOYcQcfmkjGcaGq7qV4d6+aKKi2JW0FO9S0=
tSn4DSiSaJuBCROs4ERjPLi2DyXiHDnJM9Vb88N0tZVS0OyiIKiuppY0ktpAhhCRLMow57MySMB=
9Hx29tEwYMGYjyUxLZAcM5UHU7l2DP1Siu9HBHDtVpaYyQzW0BWRYlEoMCPjueXdePc5AGj+3dQ=
eg8iw2y92WOos0VZVVlvp3t9QGtquKJY424ueY9M5lILcmjJX9ShoNd9dDY1rqCkWmprVX3Kw1N=
Rbzb6kLKkRkWsIwDgBWU4yCSCVyTpXecvRGu6dXjcGxLdZqe4B6WOmRpqiOp85mgEpiieT+7A8z=
9Q98kZHfWJxOAMjLfys0FjXEFpz3+OCg7hctvXPbV4sFmuNop62bcNDXUaxU9RR000KUkkcxRp2=
YRr5kgIEjKcA4AyF0Q2Sh6Z2zZ1K2/BYnvMk9RHSPS3GepeQqYzGZ/hJGRYcPKGICv6V45IOoHZ=
VT0Sl2/S/25qIo70tTGs0corwHhFQC7coFKAGFivuDlc49jp3uCTpNLtK7UW3a+gS4W68GSzGkS=
pDzQyR0vOMmZMtEGNU2ZG5K0ahSVb1IXEuAuIPzyRDQ1peYJj45r01O3Bt2robbJbRWPfqOaBaQ=
VRBpxSSCbg04L+X5rLgOeRx3zhdHO1qmyLt+mt9x+DkmqrlIajzBiWOJYlaIhwvJAZFKkhscXft=
kggN2lPt5NtU1DeIbfJLWXp46kSSKkyQLTq8RVuPKNTKnAuGxh2BGSGBPVLsyClgNijleulkIJi=
uazRQgLExUqU5MOTzorBhnylOSD3Rzpjx90oYRLraeyMwdvQUMJtUCmseZgxirmdIkCxk9mBLAl=
pVByP0Ke+TkltT2iWmp4K2sZCZg9Q6yKrKAJAEUFcjuUJbJHf29OdB9hXbiUVHX19dIKr4uMT0w=
qo1QwmUKfTwL5C5J74x885Antr0FukoYI6+4GGVY4Qwa4wSNzMnF4+QUAsqesuPSc4A+euedVUN=
vMBEjvbQktRBXMYwI0ihaQPJ5nmDnywoHHyzkEdsgjP18q3tLXWWBq2OOjkrGHmpUx4VPNIChCM=
kceJ5ZwOX/AFTpnaqa03SNDBV1UZklBAkaI+nByvuG5hlBzx48XU+4YBhfae02l6inSsq562nkC=
9xCsQ9QBB9fMn9R9KkY45PuQLmyJBAxxZN9yG0R2+sqqKqfzoKmOOGCepiLyRlUJbCEg4LP7Htg=
Z/xYrncFXypqqZpIF8l/KcGdQWI5AlFzl1HEnK5GMHPcaNoaO1XqRKOorY6OSaVZJKmRlVIYwxU=
ooLgsx9zle3owe5wFbst9LHFcqqhuiz0kAiigkdUVppyyBogoY+pVkZv2Q5AOQGabQFz1aLndoC=
yq+8xvcrvb7ZBFSzmetSk4PP5cLszqpRpQRhScjkD2HfPtoZ3fYNsUvXPbO2rhYY7LYKy4W2Kvh=
eukEc0LzhZpwWkaSBJFJYI0hZVIORntZF/6Zvcb9JZke4UkdXuT8GWRaNZqajiaaOKMzSGQHkyS=
BlUAk4+/aq+rHRW32Dau5Nx2jctyr4bKsJlSWwy0XEyR07BZBOVkUn4j0gRnsoJ4gjJcIeWzfJU=
o0XMaHFtgZ0y4b8lPVnQ/ZtDtUrP0qu9y3JFa1rKuFq+oRYqszTcKJvKdmgqGjekKJJHiVSArK7=
AtSvij2JtDYPVi17U2JYq+mp66jVpbazzGcymtqIVUCUvIpeOKJlz+oOrAcWA1Vl825fBDeKsbf=
rBBYTEbnL5R40plcLGJD7KWY4Gff+Gonbu2p7t1Csew71VGwvdLtRUFRU1KhTRrNIq+a2SMBVfl=
3IGBok4Q4nh5ZLvaW1C0BsX8+5dX9bPB10+obnuCs2Fuy52VLDb5aiaz1tNJcZVlSarVWkeJQ1P=
HJDTRzBpFIAnUkhSDqstweECu2jNd7due+1c91o9s7j3BFb4KIxTRx2+sFLTzyhixEM+GkUgdwA=
Ae5YCHXTpVB006nWTY23r9f66i3XTQTS0wcVFdk1k1KFKARiR3EPmxowX0zIuT+trO3p4Y7LRUn=
UCr6cdQN5xizbYopYqSsZ5Zbw014koVhfykRliQQeU0UqApNGxJMShyxBBDSP8Ak+FvXVXY0TZu=
pHI7CFx4JK+a+3OzzdSqSmFpme2y1dTY65IJ7mrsphp2CHz4cofzkywwcxjtkY2d4Y4eoD2m2UF=
/msNRNtqHcEtbc6d3p6+SeUJFT0ion6lHIEs55MpAAwdGG7vD71i2Taa+/XbxP2KKCCCayzBr5d=
YpJ/hp6imeiUPAAyieGZFUkIclhhctqJtfhv8AERYL1Dt+h6q0lkmhsgl/LvFciUsUj1jT0LCKI=
skkfwFc8sfHjmF8FmKhsA4Wi/2P1uxwyLDcH9qo95dOqCwdK9h9R6OatV91VF2oaiCp4482ikhB=
miIA/LYVKrg5IaJ++CADa1eHKzX7Yu1LlR72pKG/7gtzXup/EHcUVJQ/GvQpyEUckvNqgQqMKQf=
NPYBGOhzr30S6g9GP7O27qJu6x3KvlpWp0tVFd2rKizqgjlNPOhAWHvUEhVJUsJCCfc9E27w4eI=
Kn2DsvqB0n60VK0tPZaaKdbrcFt0FmjqqWjr0jidmMfB3qYRnsfMC5HbIJcJAHD39hb83WAEGRu=
PlVTV+BrrHbK+S3Xis21bninq6ZnqbgwXzKajmrJhyVCO0NOzZ9vUvf3xF798MNx6X9L77vDeN8=
p1vVs3FBZaahpHWaGogf4lTU8+zKpekmVQVBPEkgaLqTbniwuV9sW1d19T7tDbrlXUVpFQ1+jqk=
T8RoZZVC5k4uz0csvbl3EipnJAESvTfxadXKKl2dFPU36nvuL5TW2pvFEtTNE/nzpVtC8okRG5T=
srsAv5mAfWuSIETvMeqV4Og3Y+i52UDl74GnETKD2OrWi8L3Uhoaa2NSBt13PcNdt63bfhZJZZp=
aFFeukeYMIY0i8yIZ5HkWYjAUkx9f0H3PZdk7y3XdLjRU9dsO7UFrvFrWVZmjWsSQxSrNGWjf1R=
FSqkkdycYxoxBg709lM5Tvd0F0sncY/hqXo6jGBou6Y+H/d/UzYN76hWy4UVNS2utgtNDSzLK1R=
d7lMrMlJTKiEGQqh/UR3Kj5kjyq6CdbbVClRWdOLzHDJF56TCINE8fp9YdSVK+tBkHGWA+egCCp=
uYdVERVcaKpEwJxk4zlT9NEln3SmDTzOAcdiT/ALdSVo8NPWu4V90tt42pVbdFnslXfqmou8MsU=
IpqcPzAdEb1kxuqr8ypzjBOqja4EEDn3+ucadpm4UjTvBVm3G6KFUx1nb3Klv0/tqOuW5Xlk+D+=
JVkiOMocqcdux+f76AGuEjDBc4J+bHW6VrdiD/HTYysKYCNRdwqhg2frjTumvQZR3bLDOc6Coqw=
cQD7e2nkVYQ4AyBj+WgDF0C1HsF5mVg3mt88DP+/UhS3hmYKJHQt7jloCgqZcYVySfpjUpRVLkq=
rSAgfXvpg4qRarHobs/ZS57jJz7Ht9NEdDWZ4Oyt7YB5e41XFrqSGBeQknHcHvo0tUilQzHIOAO=
/vq7XSuWqI0RRHMpPEZC4z30rzjwwCsxA9iffTSjQN6gpKnt21IJSyEEY7A+5PfVbjJchKaOg7k=
wjJHfPYHTZ15Jkj1Zzj6jUm1Gf8AEFAU+4PvpJ6J24kkBQc5z76WU0kBcPVM4JAWPjy7asGybhj=
sewLHUGgkrJkv9QkUUaB2bjCvpwfqZfb541Xcy8jnmOx/ho1s25bFZ+nsdNd6OpmkmulWYJqUhJ=
qdvIgAdHI7dypOO5AI7A5HmSYX0TQCVbHho65PtXqdu2vGxbvday7zWqoNHS0S1EkPwVXBLOWjI=
7NwjkwQPSxB7YyDvb/iC2HR2mOyVFDdliqtgy7Srn/CqSdoagVs1TDJGJHwy4m4NniQVDYYgYp/=
ob1wsW3N67ukuTbgttJuSyUlsS6WiVFuNK9NLTSCYciAWkNPhvV/5w/qx36DrfEH4aptrQvt/o/=
TncNHaHpB+K2Clq4q6raSnfzaiQSqzOQtUplVQ35ynAKDS0hBJjMjlBB8/RGveBOh5yPRB/RDd/=
SzYu3dw0XVXp5XXOsv9EDZKxrfHMsICSBZY/MdMYl4HkvIEIy4+Yv2i3f4at22a61ybEpdriioq=
6ohlrqamgadnp6hKZI4kmMrHzHpyGVGHJDkj3NJ9ft97I3TctgfgOz75YbbYbX8E9quFv8AhAsH=
miUCJ+bGUEvIC5AJPf8AxdrL3J1y6Rbju9eaK1XqmsM20YtuwUa0aKUSK4fERR8hMcL5XFC2f1D=
ONWYIcDe8HzIkeC5Kh7JaY1HrdO+jfUrphZunNx2X1Ioa24GW7wXGCFaUzRwrHERJgc1w7qTGD/=
h5Bu+NHO5pOgu5dnX7de0aC1Wb8MoqyCCJmZHrKqVIfh/KjZuYZGDg5QLliQSATqruqHUDZ29N/=
WK9bchqXsdst9JQSU1TTsvCGKV+MQBdmYCIoMlsnGj657v8K5s9zuVk2vRx3KnFa9JSz0NaWqHW=
R/guJD8FGFjaXmy5DYHfIFw3AWuAPHuvchcxONrmkjh39xUX0w3p0zh2ZNtXqLSUgj/tHb7k8oo=
Z5ZamkUSJMgeJvSV5g9+xQuAGbjiPq6vpS/VK2T0a0p2lij/EzTpWx0xfyx8QYhIDUhOWcZXPY4=
7YJj9zbg2Bfuskm4KepoP7I3K5w1NSIaOqhihgdgZUMfeUuFzyMY48s8PTjRfQXPwqXEyGqoDa5=
Fu3kpyuly4yUayRBZowKdsLInmlhJxZMdvcAK44ZzuPX3QY0vAFrHzj2UvQ1PQStqK+yTT2aktV=
NfqSphrAlzE1RSNT8ZUjdsuFEzYIcABeRGSFYKbk2700t/Tu67ptS0qVBrVorVUQ19TJHUTrHQv=
MkKSjLxq01avNh2WJO5JyXO3tmeG2oWr3He7zFSbUF2S201fTVtaDLN5VI4jVZFJ45eq5k/pCgq=
2ASIql254cqyespa6/w0FRHKnCopr15kOVWhZ4UMietWknq0WU9gsBbvgnUQ7IhdBYYIICX29R7=
BuGx4qy4bkWLcj1cymnNWkKxxcSqKVcer1FG5ggYLA/pbBVQ0exJYXobdfIE+CujFql7pEJKqla=
nHlrF+Xx/vTgsSQoVifcAVlV3DZrdXZisFD/AGZlu1M7x2+rj8hIGRC4WWNSvFctniPkw7fI3vO=
3tg2uy3S9WLd1HPWR1U0lPRQXanqIvLNSiRwKoRZHYwyPJ5gPECMrg/r1MmDh3efRARhJgfqPX5=
VhWS07SuNsUvfY6aoo6t0KtWwPJUK0VORFyACsRI8oEoHHCNkHtqUp6LbFJ+fV1lR5cMlLyT4yB=
8u8oSSn7AEsi5cuBxK9gM99Ae0LXtW7WmCuue4/gppI2iEPnRKzVSzZ8lVYAgNB6g59PIgZJ9Ol=
IaizU9fDTVautCt3paZ5vOTzxHJBzkRyG44RsAsPYlu/sNc5d2fP5+t2rGK+EafCIIK5oqvyllk=
imgqAExMrSKoBIbknbIwvdSMHtjPtJW4WmsvtLS3Ks8mKqlkaeZ37lyGbLN7ks2Mn3OT3zoZsVk=
S7QUyx7pjpaieokQ00sCu6xcJWUllk4l/ygDGP081yRnGovc8Ue3LNWVs+4pKmpo7lPQPS/h0gQ=
+XKYmYzAlFPJWwpPIjB+es8OJIG81EMc0B5Fv0pa6z0QuVXDGqGJGVgok5+WzRq0kXL58HLpk9/=
T3799CV8nt6Bm8tR2bucD5/79OLBY6zd9iorxRbgNvgqq+ajlZqQslPxQurZ5BpC/FlVY1YlgFO=
CRoK/s3ct111fYbPe5hVUm4KW3xXaekqKemamnt9TVNzp5YllSRfh0HfGTIBggqSZLzbcfpJ/Wq=
PvGz+0GbzktDA5pomODnIB7Z9v66oTc624zssEMQIOVwPbv/P56uneHTe6W68QWq+bylNNWTxLD=
W0llq5IpI5XpwndlXypD8SnpkCjsRy7qDXO7tg7csu2eoFxrdw3mG+bV3RSWa30NTQ+WtXTTCd1=
kkyMqzJCXBGBhfY81I6KQkxvX4TN6K+mMRy/XyFTNxacRTU0c0ixTMpeJWPFiucEgdiRk/z0M3S=
KUuZZJGdm7lmOSdWFTbf+MsdZfTM+KWtp6Ty/h3KMZUmbJkA4qR5X6SctkkZCtrI+mt0vNrO4mq=
rdSWanqBDWVEtfTiWBcjlJ8MXE8igMD6EOT2GT20xgXVWkzCqu63q83i7S3u9Xetra+aQPLWTzt=
LO5GAGLseRIAAGT8hqVqusPVKa41V3m6kbokr6+mWiqqp7xUGaenU8likcvydARkKSQD8tXTS+F=
Shv973pt23b/AB+I7b3BZLFQQz2t1+Oa4zrEsshDkQhBzYr6ySuO2c6p7rb04oumF/tlHa76bxb=
r7aKe90NRJTinmFPMXCrLGHdUk9BJCuwGR3zkAhszAyXSWvaJOyo+/wDW3qruilrqHcvUXcV2gu=
McMVXHXXKWcTJFIZIgwdjkK7Ow+hZj8zk+2t42Ove17ferdU7pa+re7bLbud4aWdqOOWOVGaAB1=
UMRM59SsucHHbVBSPy9sDv8taAduRGOXcEn3GtAt3JgTlKM969Vt/8AUVqN98buuV7agDCA1k5c=
oWChm+7sI0DOcswRck4GiOTxNdbJ46Wmqd/V09LRUMdup6OVI3pY6eNo2jUQMpjHEwQEHjkeTHg=
+hcVScYGP6a2RuGScEn6jRAC11aUPiO6vRTbfnbeVROdsy/EWxJ4YpY4pfLEYkZGUrI6xgIrOGK=
qAAQBqSpPFN1ho4aKkjvtvmiorYLKFqLLRSmahWPy1ppi0RM0Sp2VHJA7YGqcWXv3UZ/bSySAAg=
r76OELSVaNj8R/VCwSUklDdaNzbrpPeKHz7ZTSijqpoxHI0HJD5IIVCFTiFMaEAFVIZbn65dQd4=
Uu4qG8XeEQ7suqXq8pS0kNOK2qQMI2k8tRlV5uVX2DOxxk51XHL6Aa3WUqCCFA/bWGc73coG9t7=
sFbnTfxFb/wCl9ptln2x+FJTWrccG6ofiKJZXNdDG0aFiTniEZhgY/Ue+rBufje6vXrbVTtSuoN=
rS2uaja3QwrbWUUdGfJ5U8WH7IzU0LktybkvYgEg80pL7EFTke2PbSizlf0nGffGhhAvvd0O/en=
wuoL149urm4rBVbcvdh2jU01THXIrNSVIeFqv4rz5ExPgsRWyr6gwAC9s8i3OJqsk+rsdRwqOXu=
vcaXikHHOcEfLHy0RYQli8p6s7MACc476cxyE9gffTCMlu576e0YHIKV9+51kIUpBHL5Ql4krn3=
99OEkkGQCWU+515RyvT+lQrxN7j66WmSMAyRdombAJ91P0OjKUhKwSEqO/wC2pWkqmiwi5z++h9=
JlVsA5GexzqQo5mLj3znWCm4I4sc0kkqs7AfLuPtqxbHTyFVY4wew1XO3fW8acT75bVu7cpOcaB=
V98ccjOrsXnVjxU3Q0RC4Uk4AHY6lo6GTA7ZHvxB0+tluXC4U5P0PvqdhtZzkE+kYBJ+vfVQ7Re=
e5xQ2aHAAVAO/v7ED9/4a8aiOQVI9Q9OR/w0UtbQD6YjgnGPl++tJbWCVUqP/e/46IWDyvmvUoV=
TkeIX3xqfs24IbDteOom27RXdUr5SUqouax5EB5exHfgVOfk2htpPMjc9/bHc99ENh3Km2dvV4n=
oxVR1ci05jZFZcHixzyB/0Pp7415bcl9W3NEvQvq3tPZXVqu3nuHo5trdFvrKKWBLFWALSQSMFx=
IgZHxxIJAxnBPqB76t/qf1Q2t1M2rb7ftPw52TZNRb53r6i7WkFmnp8FQr4iTChv8WeOR7DQJ0A=
3/syxdYrluG9dIxuChlsDpHSmwQVi08gjU/GmjYiPjhSx9QADZB10ntnxa9Fopo5rrs64Cip7Xc=
bFDaEslB8K9FPXNPEkjKVZgsbKhjIKAqx7lydKwwSQNfj29Ea2Qk7/aLL94rvDvvPb+17Ju/bFx=
v8ljpY45JbjZ45gVMFPHNFGGmJRmMJYSjGPpknUHdesHh8qbDuPbmzdryWGm3JbGp2qYrEjtC6V=
kM1PHw88ciqJIpcMMsUYg4xpre/EB4YJdvzjanSbbEVbS2lobbTVmy4z/nIMGRU1C1OZuSpOA4V=
WTzAckjvKT9XPCBcbHGKHpXS017anCTSSWqX4dPyoy/COKoT1+aZeLEgBcZ7YGq0gKeFoBtl4Ll=
qkvkki/up62dTfDhuivgXfFmq6qf8FtVrhmaCSExTRUsscvqEgCr5nkEM3bGT2GdQfWMbF2D1gs=
TbJktcVut8FBWVL2yc1CLP5zM/fm/fiF7Z+n10aWXxEdAkt+4LpW7e8673CxUKUlO9hiCxVlPQP=
CEErGTA83gwcBQO3uQcqx9e+kktFd6uovc1RuCitNJb7VX3ikqJVrQEFVN5qxLgH4wmMZAAjVQu=
B30aeJjYgwRH4yU3lrjmJmfVMtwbm8H113NUXOStLRV9ZJU3FqeluaMWd1KGkBQKgxzaUSD3P5f=
y0NXm7+Huo23PZtuVdmaqa4WaumqJ6W4p5vH4hKyCmllRnjTDQH8xSvqc+sqvGyo/EF4fKuidN7=
11tvtRXRNJdo4rLOySyYYRR0xkp1fipwcyMnHkSCx9m9w6m+Dm4VYqK2x2qWJqiF7l5dikRqo+Z=
HxanPkIUCICJAPKD+r0yZB0cRIgymDQDIIQrbaronu3d27Ib3PtWzWGTdlqit0tDDFTTG2q8iSv=
EwjUqCGh8whVHYs3cF9Jbs2p0JpNp3q+bf39Sx3e3Uohis8dy+KMta5pWzDJxHnRJznQsowcE8h=
wOnnUbcXhjuOw9znaNPZlvvlRKjUtEsPnVpWLi1IPLV0jBWQNwEcf6uStlDqN6O2LoFuHpqJeoW=
87FZL8Jp7cyVMiRVHCWppWWdeQ7lUDqr91VXlLdgSFLsMO7/tEMDpbaYzQrs2osNfdrVY91+TQW=
hq2WrrLjTskdZ5fk9ohLIGTjlcgFT6n/bV9SdJOhlNRR1e2+sj3Cp4ipWm+NowaiEyRIIwSB5Tk=
y4DNkDgSV7HFOf2d6V0FwutOb7QV9st+77NHFI25KT4ia0TRSfEcTGWEnCR4ebIGA4H9IDMJ2XY=
nTuu3HebLT3S30dLJv+ltlFXU17p6nybTNT1Dc0OcOit8OWYgkfpLZDMZPMHffvyRpttBAJ/W/N=
HEu39jW7aYvpnjS9mtpqClt1zrVqs1MtUUeOokpXEapHT5l7BDyK+od0aOSj2rd6ddzbbqpqwVL=
v5VoMCU0DKrmI/myVXMMSjTiBeTlCq8hnmAffOx9m7b6YxdRbNe7vXLW/BLSwyJTtFTtP6/ImdD=
nzURHJwo/UgxjJMNtbaWzN5bGtnxUs1LuC/X2uoIa5TyWjhpaRajCwZUTtLh41BZPUy4PpIMXCI=
nX7VAyTGEW+ldW3rH05Wtlq7fvO5UF8ttzpEk+HMlMKdZ6CSRYEb1tzkmXy+PJ2UMsfqY5aMumw=
Ni3W+Mai7XWT4yukrqm6i5+cJKt1kkez/3ZLVPJSvPLSln/uyex576r9N6XpftK3bhq98NVVN3q=
JIqG3NamhkxGkLyeayyMsTqKiMcTnLJMoPoBaW2PsjpTuLpttuu3O90oL/fqfcddHVpUS/Dqluo=
5ZVkKKhGAyrnB5HGADk4LQBHerBocS0tFlP9b+m+0to7WuF0sU14uNb51NU0tYs3OlRp5FU2t18=
vJqIg2eXMOcHMa6AbZ0Ql3n05s+6LLdKi2XyOru0d5pa1JWVYaRVYNCqRemVcOpiZ+TFl44w+Nf=
EJ0d2J0421ebztq+XieSz3S3WrjUEtHLVVVBT1gkB4ABfLafOSCCUGNBe1ehHVe+dNLd1Rse84L=
fR1dTUT0dGlbKtTmngrJfPRUzglqKeNT2Jb7ZOrgSG9/PNYUgHkYdEc1Xhd33ar5adobo6mRW6n=
vVZbp1ijjq3Vo6ueGKGYrxCCUPURgox5KSTnAJ05tXhf3VuPbu/rvU9QamKSn3DGtDHdaiWKGuh=
jmqY3uFY0i59MaT8CV5d3OArDkAXjpZ1CNnNjuHWmvkq13Teaa6W6oluLUlK9tiE0tc5CMrPwYu=
CAXPNAvJuQWMpbR11brFH0gpupV4r9w1tbDPBLFfqoRVFTURR1KS82IIkYeUSzAEMoyRxyGwlgx=
EbEg898Wexv+cJ/cQiTcHQzeey6Wsr7jV2autlLSfiK1ltrviaaeLzYIVaN1XixLVSYGQcc/p30=
230R6nbqt8W99kmKnktteY6dhOy1cc8M9KryJGil/wApqynY4GcE4BIxoxuPRrxCUm2Pjd471FT=
ZLxULcitbuSSWOqREx8cyOSSEUDJYeaAP0dtEM21fEhTWO0bOtW6LFaae8blaqeuNxzV19RUVNN=
TyTTiQF2p1qVhiZeKq0gAZX9J0xm05a+W/NQFEYv8AJyVbVOzfFe1XvC5jqTaKeRL0lJebpWbjo=
aaWaspY4FWWKeZlkYwx1EGGjII8z0927899dqLetX1xvtg6j77pb5f6e6C2V16kqvNgJjIiDMyg=
8VRVAKgZXiRjII1b3U7b/WTdbXy1ybxtt+Xb/USGx0kVJHR06VV0qKeRFq1aLEagxW2JW5NxGBk=
ghjqF3hZeqgotz7+6lbN2Fcd1xbkFtrqy6XKlS5R13KMKUoY6hYZkzg/3Dq6s7nkgZgT2ZHH7+O=
RsrhmMDCD4+HzzCqnqf0ioumFfuWx3PfFBV3ixXOkoaejgp5VaugmgaZ6lS4BjWP8AKUq4DEy9h=
6TqIsXSHqLuPaLb8s22KipsCVNXSNXLJGEEtLS/FzoQWB9MHr9sHsBknGrj6t+HrxKdQ+p27rvW=
WSk3TcLZd/wWuuNtWmo4qioiangJjgPlsVVp6dGcJgFxyI76GrF1A8QnTDb9x8NVHB8HT7jqGll=
tEtvgnqPPq6dIWaJyrOjyQgRniQeLMOxJ1hBIJy1TYRJt+PZMLn4Y+oFsgvVbM0RpNu0lsqLnOY=
5AtPJWQxzGI+nJMSPlyoIPEceXJciXU/pNu3pRvit2JuOglNbSVElPFKkMix1gWRo/Nh5gF42ZG=
CtjvjVubzfxA7P3Tvl790vpKuC2iKy3mVbBJUWynFDEIIpEdgVXjEy8ZCc4dHGG4toR3PuHrP19=
rj1Hm2VX3qLb7TtV1VrtMz0sHm1dRWuJmQEIOc8xGSMIAPZc6IADTOfvqgQ2ezsaKAfoB1vgrJq=
GXpJu5KimgFVNE1nqA8cRLAOw4ZC5Rhn6qfodOKDoF1XqLn+F3XZtxsTm1V95WW700lJG9LRxNL=
O6l19WAuMLn1FR89XTuzq/4g9yU90od4dBPOhnp6IzxyWa6QNC1OtX5M7yLKsjkCqnx5jMuEUAY=
TGkper3X7fO9947zue0KNGi2Xcaaps9wqKilpLdbJaSKhqp6KCeoVvNMaR5CFiSMlTx7KwkxPd6=
jJBwAB8fRUhZeh3VncVRNS2rp9e5JKe31N1fzKN4x8LTxGWWQFwAcKOwGSxKgAkgEHZWjLIwwVO=
CPbGu19y+IPfm5L7Tw9POk9zuO2dubJmoa2mulPPSSzU8tspKKpmldJiOBFGhTgUJ5sMFjyPG10=
oLhBMtVWWuaiiqiZIQ0bIrKTn0FvcDI75Py0zTLQdfoJXCHQMk0DFBnsdbJJ9cffSRbGQPlr329=
hk/I6KMJ0hUkd9OI+P9PrplG2D3B07UMkaS8lwxKgBgW7Y9x7gd/wCPf6HSlCAn0RHtxPb209hY=
A8v4+2o+jjnqpY4KeJ5ZZWCoiKWZmPsAPc6nxtrc8DyRVG3rkkkKq0itSSBkUkgEjHYEg4/Y6Eo=
ELEqgiY+bHuTpvJOfMIU4GfrnXrWq7nkTbar05Dfkt6cEg57dsEH+WkPIlXtJGwJ7jI99FKWp1D=
KzNkt+2pe3y4K5bt9cahFjC8T6sg9+3bT2kcKAefq5fpwR/XRCm4Kxtt1R5oC2D9cauraVQrpH3=
JPEds653slc8bg5H0OrY2huDywgY5z2znA1dhXm9JYSr+s4V0UHt8s5/wBeiqmpkMYUEE4ye2q7=
21dkniQYUntqwrZP5gHIdyOxz7aoBxXlO7JTxqUZHH+WPbST0OV9QXHt9TqRRCAfmD79863WJmy=
OI5fyGmSAr5JRu5PE6IbDeaW0xGtrLS1ygWcc6UEYcGNhg5BwPvjOh5mVXJwe51P7T3d/ZGWqrl=
oTVmVHg8oS+XgSRsvLIB9iQcfPGvKBMWX2OqtDod1rtG0fEjB1Brtq3J7Y9vnoJLbT0sUshjeka=
IDyW4xug7HgcDiMa6VtPiT8NNkulTcarw8BrY6imo7RW7TtbxUhE7c3+Jb82V2jOOLdkK4Ukd9c=
/dEesF92/wCKOx9Uavpnfql6K3TCa2UkbS1DwpBJHJKoZAOK+ontgcW79tXL4qfE7ZeqezP+jk7=
Cv+3LzQ7lnvEi3SmhiaOGaWpkRGUDmGKVER+nv3PYlabJebcNUKzuyCrc3D1T8IG1rBtutpel+3=
SLrQzHy59mJVPQjFMY1n5NEZXZRVYcS5BYHuqqSPHrR4QbrZY/hOldmor2aJKeWaXbRNOMRQ8yI=
oJ4/wAwyCbi/IY+ZwdQtl8VvQOr2Vs/aW/ts7lv9Pty1Q0c9uqbLRyUs1UvECpEjVBcmPj6RxUM=
hdGBEh4zrdb/AAj3mko4bL08tlrrIaERmpl2DBUBceSZhJGlSBK8nCTjJ6TEG7E5OXaTAJBlScA=
SYIQrv3qV033bXx3y0Uq0s8+zobVNSfgMfCnroljVSjtK2OWH/MUBkHEeok4luiXWbb/TfZe4bf=
dPgamtut1tyx0tbSSTx/BnmlTIOI4hgjhgCe5UdjgafXXqb4aZReqDZ9nitVv3Rt+ekqJG2+7y0=
VWKiKWLggmUEFOa+lgA0aZPHOdrfvDwv7mmo4eoFvnnan21arVDPBHV05gq4451nPpcKfUYGDOG=
Gc/LI0XuluAgwPoe/Jc4aWvxgiT978VL7n639Ka7ZW5bRZaGyfEVVoq0t6TW+Yyitlq62IcH4dv=
81qvNHIgB1j7+niKk2pN0hHT291O7qhhuqjnWS1U7SVIjq4wq5iYRpxUljkMW74YHjkNqX8Qe3+=
l+yeo9otGyI7WtpeggqK34K5y1UbM88n6pC8jIfKEZIX6kgHtqZ3jbPCh8bT/2PulHJHLPCatai=
4XKNaeIr6hCxicyuGyDyCgjifR302INECePLLeqADnOkxa3PNEVRtrwtbjv9/ui78tFD8fuCme2=
UVJUS0VNS21pYfNDGVAA/ltO2FHFCoGSSBprt+y+GLcH43tz8QSzU9Lu+3QrdblfYkna2+VLFNJ=
AfLKyxmXixAwQJFdiFi7wu17b0A3JeN0bM23SSeVdLnY7baDWz/EVlSv4kVqZaSQxBo1amKMQQD=
nkDkY0n1Y2b0S2dtve20NqV1JPuSx3y2yJLWXUGdYRBMlRBCPLHnYkKckXGC4JOIsFA6XFsmQrE=
ANDoELe8dK+ndn6WX3e8O7VkrqGrFDbmW80c9NcagJQO8cSovKUgVVRkxsePw+W9+zXp5tjp9uX=
ZlAm4PJiu973Ylo+LFxjgkoKRYBM0io0h5F+EkY5xceTr6wVw0R0+2p0eunTSLcm9+owiu1FfKc=
Db/4pFTrJRNU08U7BHzIHEcssvJFIKxkdiDiGq9v9Ov8A7RtVtJ6y1y7Ne+VCUb093SopXpmDtT=
IapGA4k+WpPIFQSC2QW1Fz5aTOU+45J2t7YgC8D09UYbt2ZbbFS1W1qDcVw3BY6Hf1uttHIK//A=
DOekngaQuiRyGPzCHUNIF/0cEZI063B4Y9r3DcF2lsm+J6WOPdN2pKagNtM8K0NPVzpHGlV5wMt=
Q8MIZYgOTc0OQDy1LV/h68Om47DW09t3dBaLsapIYnpq9aqT8RBDT2qGNpyj4iBKEliXYAynHEw=
G3vDL0RrbVRpe7tdqKse4TU61FZXwU9RNWDzCtqkp4mkEUwRIW9LM5M2B3AGgDaAd3+eS62U7yR=
u2/FUn1l2ba9lbh3lT2h69aGy7rktVuWWRGQ0jJJJG5JPNiyqhBClSCST3XIvsq02zcG4Nr2+8b=
tkkpLjcoKGptttWZ7hFBLJwk8sMghyV7/rPY+x7jXSV68JvSOC50tNR3G410M0rYqI7zHJ5tesN=
SxsgCRN+cr08acl5SEuR5ecAgfiO8OOxOiW1Z9xbF3jcLnWUlVTuLhFVDhTSvNLFJbm4IAJ4zGS=
WEnP8uQNFGME1/wBiG2O97KPV9W7ERa3tPmlNm+Hqw7023JcbvfN4JNT73udmraOOASNLSUVsqa=
tFgVjl6iQU6xqxGAXA4tjvTXVptz9E+pN56ebU6iXxqLb1Z/mU0NZJTGMyRq59KPhHHPixGMlT2=
HsAJt77uhblFue7IyzCpVlrZQRKOwf9X6v+t76Ha2snrKiapqZnnnnZpZJJGLO7E5LEnuSST3Pv=
nVLXkKRIIGFFMXVjqVTTvUU/UPcsU8tUa55I7tUK7VHDy/OJD5MnD08vfj2zjtpSz9QN2UW503h=
T7qu6bgExnF1Wtk+M80jHPzuXPlgn1ZzoJyASCce2t4qgRv3b5gaP5SmdF0Vs3xHdTrJcLdNXbv=
uV5orVKZYrfca2aSA+gqEwGDcByyEBC574zpXfPiK6p7jeoqZd31NFDLdGvEMFGfL+Em84TBYpP=
7xIhMFlEYfh5iiTjz9WqC/FRHUN5MjmNWPAsoViuexIGcH+J17VXd5Y8EnGNFSJfkCjy6+Ijqqt=
dW1r7njnkr7tT3yqEtupXSWsggkgicqY8cRDLJH5YxGVYgqdQN58QfUC+SXY3lbDVrfKuiq69Gs=
NHGsjUqxiNVEca+UpEUYcR8OfH1E5OQOtqjIWI+f31GsSSSNEkqjHOAzV41HjH6zVUdZ8RWWh5q=
65zXSWo/Do1mMk1XTVkyBhjCPUUVO5X/q8QQvp1V+4d9Xnct0t13uQp/PtdFSUEAjj4qYqZFSPk=
PmcKMn5nOhs/TWZ1usdBbNjmq4nWvkr3uni+6g3Wh3NSvt/bNPLuhru9TUU9HIjxPdEhSvdB5nE=
tMtPHkuGKkHjx1B7D8Q24djbEh2BDYbVcKGjvrbiopKlqhZKeteKKJ2/KkQOOEKAK4YDJ7d9VLn=
6az59iNKTNj+fPNbEc11jbf8AKCdRaHa9LsSh27ZrVZI/joXel+KkqBDVxVMcvqeb1lTWSyJyPZ=
wnyGonqT4sLdf9/bjvW29sNW2Wvtlda7ebiZIamJKqs+LeWULLIpYSegKG4FAOy5wOZQdbByAVD=
HB9+/vpw8gZ9/ulPaz/AB7Lqndfjr3Jva/Xq5X3azyUF7sVTZ3t0V4lhjgaWpSoEkZjVcKrx8Ap=
HIxsymTuCB7rj4pqHrrUWSPdGyapLbt6311NQUMd0hRKeonhjjjkRo6VGMcbQxt5b82bBHmDORz=
yrAd869J7dvfWbbLeQ9liJzRfbbz04iex/iuzbnUJR01Qt2EV3EZuE7M5hdMxH4dVBjUr6y3Bjk=
csBaz1nSlRtxL7aNyv5TVLbgelrIVM4LHyEpQyHy8ALzZ+WSWwOwyFg9/c69Bx2zoToijGzTdMj=
+Bi/wAe5VP4lIb2aNoDig9HBaYOO8397kuePdMDscr0x6XS08S1FTuWCpkvvGRligljis2B6h6l=
L1WSe3pTA9+/YKBHsM5zj21upxrZrSjmz3yx7e6i0t42nd7rb7XQ3NJqKunjX42CFXBWUrGePmA=
d/Sff2Pz12RH4zOnV26wb+39uLdd+qbXfdxbfltlO1C3JbVQ1PnPGVDcR8wFJ78mJ9+/AasV9z8=
9LpIcEjWLASTxSkEx3fXwvpTH48emO5LZTT3nc81luFS9E1xSnsEjoFjeoedY4kcRM0omSNi/IY=
5PxLKmlJfFn4dK6Glkue5mrZ7bd6u8SGS0zM1SjJXmlp4iye0bT0q8W4ooQ8SQBr5rh2HsdOI3I=
Az89Dqxvfepkb8vhdL+KHrtTdULJ0+sVtv1puMNnscclxFDbPhfKuL5EiEmNCyqgRRjI7E5JOdD=
vU3qJsy+9I+luzdr2eyU1ysdBVvfKikojHUyVclQwXzZCo8wmJY2yCwycdsAapFXycew/fS6Mfs=
dM1obA4CErhM95lElBVlWGGxo32/dzG6nmRjGNVvRN6gMjJ0T2mYhhg9vb31RpIXPVbIXQGztxD=
KAyqQ331c22rqjxoTjBI7a5j2xcTHJGv0H89XvtCt5RIGIOca6mmRdeL0luEyFblI/mJyB7N9u+=
nqke+ME9vudQ1rqleNeLYIHfJ9tTMbgjsfvorkC+QTknGHGn9ju0u366K7pCk4ikwYuQy44kEYw=
cdj741HMQQflqQ23W1VvvNNV0ND8XNHIOMH/6mQRj+uvHC+zV8dHup+7bf4i9p7hg6OVN2rJbTU=
UK2CF2D3GGdJjI6ZQ9j5jtjifYjXS+6vGRtOl36lBvboXVWZ6WOrp7nTV1so6m4Uc7RBKaaJpo1=
LMqk5STC4II+/FvT/radvdbNl9Sq7bRnO2/LRqOGo8v4gKXP6mVuPd/oew12fZvE9P1AkjvNJ4Z=
rhdlqqZ7ZDVQywzfmwU8rPPHmm4mdY3Vmx2CoowBjQY0BxJHBGobNEoj2V4ivDJuu4xPvXpJb9p=
2iqeSWguNx27Sy07eXVSPPDGyRnzGMElNGc/o9RBB486B6Gb3sHTzqNcd77st1yXb16obxb6aWj=
tiskrTxPGBGrFFAXmMhT2HbGDrzrv4iNq9Zdo22wW/Z9XYJ7Pe7hXUcEMkBpVpahgwRuKK4dWz2=
XC+ok57YPNieJ7pNRbd2PtPfe0rxfbRtmwzUE9vehpXpjcGqeYqUjMo5nyXkjDsVZSeWG5EaoQY=
wxnyg7K57EzveisuPq74H7pHHHVdKpbeTapaCR1sioshaKBRP+XJlXVxKQ64IAbPcjXm+Ll4LrK=
rUKWiw11TWWwTQ1Nslqp46bLVAEZEE2PiQopuzkLnkSRnBrbavWvp1aTtcXJtyU1NQbIvu2Kk/h=
UKib4qSb4d4ws/5igTEMTg5j/xZyLEo+sXhJtwrprVtKXblwq9tVVpp6iOxSoi+fD5beaBKfNlV=
iG83jjjyHclcI03jeiV1wTvVU50g3jsTau1d5wbtS3mtu9NQ0NKZ6QzSGnacCs8r0Mqv5RYhiQe=
QXHtqw7rB4LaemopqekpamWa5UlLUx0V3ukQp6OSolElSpmRubRxCnZo+wOZQpB4nVLdL917Es1=
t3Tad6yGB7vbI6elrEpvOdAs6PNCuATG00QeMOPYkZIBJFsbsvHgpNqq6jau27bPXyz01NSU34v=
eIliiaWVXqHaRe7KPIZ0xjHmBGzg6W+J2ewsz/AC0W8fyk+oNj8HNus90vXTzd91q6+GnFRb6GW=
smjImjqApiyYssJIuTA5BQgdzyGK96jQ9PZ+u1SNt3G1T7Qud3pp4jSVTrDDSyOvNHkkRPLYDkW=
9wucciQTp3vC9eF1L1uq3WHZt9jhjmWGyVNvuT1EMqKz5m5TujJyUp6WSTBB+RxrbZtZ0KfYG6o=
b5b3AWvtFRTGpqIvxqaFJiayKmPaJVMeMdgSS2SewAqGxF72RbcjK10f3LYnhr35uq/3N962Lat=
M13lo6WKhvtHDTR08dTSwwukUgJcSQyTztIrcAYyD8yKGuN52PtLqhHX7dtku5Nt2ivik+CvRhZ=
axUA82J2gLRvGXDAOuQy4OO+NWL1a/6Cp4upk204bPSQGPb020YqSQNOlQY4lrIcqzcohH55cuc=
GUKck4zz/OyMuD/pnsD3/ST/ALNKLgyZlM4w4QMlf2zOhnTPqvs21b3n3T/Zmsq6iO1vaqVqNg7=
wU/EBElmR2lqDEzDsW8yQApwPm69k8F1qq75b6a1bzu1RR11ZBSN8PbIqmqpJXWsM0UkccuDJT+=
RTiUKe3n/ZQ3MVSgcPKSWxGpOMdvUB301eFY5FBRXcvIpBUYBA7n/WdO1rv+l0NqNGbV0bYPCRQ=
7lrNvnaHU6+VNrvfOvp70m2JhRxJGKomIMsxc14+EbFOF781w5B1UXWKw7f6b3G9dKpZLtXXaxX=
Bo/j3kkgpqh/MLec1LIOUchhaNCp7hgfU2gYzyUvGSCaWKQRxMjQsy8Ce2f39/p88dtR1e800rV=
NRzlaWSR2kkJLM2cliT7n9/qdVAIzKxqA/wCQrd2Z4XNw762tT7noN2WimBstbuGrjnpa1hSUEC=
1BZ3kjgeMufhJQEB5HK4BycGW2v8nZ1i3jbqu6WDdGy5YqKSsinWSvnR0NPLURscGH2Y0xI+0iZ=
xhuPPVDvbeNnhip7Ju28UMNMzywQ09dLEkTsCGKqrAKSCQSO5BOnFF1T6lWiOrjtu+tw0sNeFFW=
sNwmXz+XMtyIbvlpJD39y7fU6Yd6fFT0Csat8G/U2htaXyrvG1o6J7lW2tpWuZBikpVq2Z3XhyE=
bpQVTo2O4j+RIGo7f/he3T0z6MS9Vd3XGCmrBuqPbkVrTjKZIzHVlqnzA2VXzKKRFUr6h6sjHcJ=
rOsXU+pt34VPv2+yUPmSzfDvWyGPzJBMJG45xlhU1AJ+fmv9Tpjunq71N3lZBtzdO+LzdbYKo1o=
paureWMVHKQ+ZxY/qzPMc/+sb6nTy31+lndWQcIvuUKGVg4HIDOvGmIXBk7+2kSWBJx/DWtQyNK=
5hUhCxKBiM4+WcfPSypFq1kdWPeQ6RIH1OtyMd/r7a1wcjGstktSfsdea2wTrwjt7aCKzA7lQca=
9wR8h31u5UkrGjIuFBBbOSB3P88n7Z1rjucdhrQtK19++t0Usc/Ia8VSQSBkDuTpRSVXI7A++iA=
jK1OSdej5fPXhJJH2172z2OiEFsce4UAa9AGdagfU63GQdFGVsnYgg4I9tbBT8tajJ+X30qqntg=
fbTAISvVB92wNLIpz3yNYifL5DW/H2++sUJSkSEkZ9tOQBkEHtpKNDjJzpdUJ+vc6yBut1ABHqG=
locA5B7DSIA9y3cnSkZOc5PfWSKUpSc9jnU9bpArj3Hsc6HaWcxOrIcEd86l6Of1cm+Z76IU3iQ=
rG29UiNxmQJ2z31dezLrGUQLIBj6653tNWAQO5wc5zqytr3wQlQXAzj3/AOf210tOi8rpFMldKW=
e6gopB7Y+uiGG4IPdsqfp7A6p6ybkVUUvJ2x76JabcTHGZBhv6apC8stLTdfNYgFST3BOD305st=
bV2y5U9fb6fz6iCRXijAJ5MPb27nTUtkY7DOlbcJzXQrSQJNM0iqiOSFYkgAHBB/rrxwvswFbPS=
Pe++bX1X6Y3ei2Wt1uFvrWjtlNUSgPXSZEfEM/ZeLDK5BAbP7a6fTxn7hpLise7tiX+tqrHf5Lh=
TmW5RIwn+E+GljnWOmWNz7t6VT9R7HXI9v6jb7oupmzdzXDaqyXCw3damkp44JE+KlEqMYx757q=
o9P1z3J13zYPEx4gL7cbTXUPhsucctFcXt9PHLc5qSCerqIouIqllRRNNiEcXYgDzCO5YaGEEkk=
afM8lngwI3kgy5eOHZFwuKVT9D6KkSOlmjFKsNvkjNU8MiGocvSl2bm6Nx5BfQOxzr3Z/jG6RQ2=
ami3Z0KslRekhAashstHLAkzPI0jJATGSpVkUKX7BM5+p9dvHRt2LbNJdqvple6fdJqWgrKCOjj=
WnpX8icNVRSyxsjTkyxOeSEEKuQQMkEofGvsqKmmpb10Xp6yqJk8quq6eglmjlaaoZpSnw6xFyk=
0aH0gfl+3tqpbfJc8nJFPT3xi9P9pzWG/br6eX0yRWOa2wJSWujhp2iWqd4miYMjOhzwdSeKmLs=
GLOdJ7I8UuyKuIHdFi3pdZ7Xt+qpYbg1OK6SlrK4Mtc2POAEPFKZY/bikTDiCxYgN06yR7yOy62=
Hp9uyKqs9HdYKNLdDSCKegmmqOLRgUxyUMiIxACDy24gM2Qj0N3p1C6Bw7jqItjbsjve6bXFBYV=
/BpJIJZYpUmaR0ZkLqI+WOIbHLJGMg85bGQ4e3oFmuMwTZXVbvFt0Se2XZ93NXXG53ClY1Smz1a=
wTr5dSvwsEUtTMInJliyrN8OffiCBhne/El4QLlZq+Cq2QlTUimVndbEAa+MpOEpFYjKmJpImJY=
onowrMFUGJvXilno625VtF033FYfibTe6imaq28SJKuV4GpKlszf4T5pkb9GXT0kHtRHSm9dGrH=
sDetJ1M29BW7jmpEn241RQ1MoLiOQAZjkQKpcpknj+5xjTR67K2MzFsthXZ1P6peFfcO090UW0o=
7cbtLbHjWQWNYGuFQ6SCjEJ8kGM0+Yg5BiB49zLjuFdA4fDNdOlNRaesG56Ozbg/E6uGNpKMySN=
R1CUaCRXVCQyGOUqc4XlKSO+pOt3H4Od13C9Xu+SWyguFwitktDTRWu6UtPQmPj50LiHn5hYKwd=
hxUAx8CTyYaW66+De91t920bNarDZE3BbXhuFVVXKWasoEkmSZ6VggeLkjQkpIAMmRifTGFm64G=
dvhMJxE2uhCr2/4frTVbgpaG50tystPuPbk9K09zjare2yRt8fEsioCwjlkAYquSqA/LOntz6f8=
ARO97s3TYzuSxWu21nUyigobjS3WBzS2OaCrLNFy4jy0d6bmMEDAXPpLaebu6TeH639JN1b2tm4=
BM9G8FvsdfTV8zQ1txFHQvLEkUkQZ1Mr1xJOMKq+3yC+ltr6QXjp3FZd5pbYbpfN2pRVFweuihr=
KC3pTCbzIA54qXdHh5uPLzL6v0jEzx3ad/kBUYL4YH7jf4SfU7odsPafRum6rbV3Ld7lHcRb1gS=
WWnMUD1BkZ4ZCoBdkEDgsuByIHupGtdi9LenW7OmtiW6NPTbm3HuG7xvVpUoZKano6ISpBDC0oV=
mqHLRqzgetRggKQ8hfdo9PrMsm07HuxdwbYpOo1uiozWXmMxT2yWn5SSGKN1UYLcXlCgdgMrgjU=
xuDoL0Kq931lbZuoEKUk+6rwY6CKopHoktcNTWeRTJI1QsrSSRU8QUkccTIeWqYuyDlHPMe0roa=
yTkL8siq98RHh+2h0TtVLJRdQay911fK0VPCbaqQSJDIFm/OjkZS6FkDIQO+fsNE3Tfw6dIt4dM=
bTeN03Tctj3Bdtt7jv8ATTAM1ARb4qhmlc/Dt+WrJT8kjZ5CGbsuVOq8607G2ZtK+bxba5kSCl3=
ncbRa44rjBPB+GREPTkJyM7+kr+YTwIAGS3LW/RjpPtHfO89kWm6dQIatty3aKguNjtFPWLdaeC=
UkO5kkp/huChSzESNhSTgkEC7zgEzlzhCnBdGHP3Un1n6D9O+n2xrnuay3291VbDuuo2xRwzQny=
Xemmn853fyVXHkGjK4cEu0w44XAiaXwmb6uXSix9Vaa7WQUd8YxJQmSYVUREhWNmUIVIcKWBB7D=
3Azqxdm+HGm3battU19q9809PWX++UdfSzkpCZ6OSmWIw5RyHxPUNI5RmxTzBU9J1SO7rnvLprv=
C+bO2x1A3A9Ftq73O2WyqorhLHHMsE7oXi8tuKgpI7HicYlb/AEu9iCe0MpPqfhEhrT2xnHp7qU=
qvDNVi32qSl6i7deWdLm1y81KyOG2NTSiPjI5p/UzuOChOXcfJQW0F27onu6779vnTqkmti3Lb3=
xhrZZ6xYqdUpc+e4kbAKqFLfLIB7fLS1v6vdW7JUKLV1D3DCz1UtUFjuUhzUVC4lkYcsF3DEM3c=
nJBPvoepN27jorxX3envNUtwuomiq5/NPOZJgyzK7H35A9/rk6Bgi2x8oSwuFraqzx4KPEBI8Jp=
trUNVJM64hhvFI8y5ZUTlH5nNebOgQkDkXUe7Aah7D4V+p96aKR4LPSUr089Q1TPeKRVQxwPOEY=
eZlWeNeaggZT1/pBbU/wBLfGL1l6YX438XOPcS+V3o7tzeF5Eljkilby2RpHRokCl2YKMgAdsB6=
9fuqMNLboI79GsNqV4adTRQEFWpjTkSDh+d+Q7RjzOWFOBqjerzdKx6u0Soux9Et97rpdvPtK0t=
eKvcZrhR0dIyvKVpSvms2Dhf19gcHABxhlJe2bw9b9vNTsqkT8NpxvqmmrLZNLVZVIYnmV2lWMM=
yY+HkP6ScAfM41JbZ8Q3UnacNupdo3uCimgareTnb6Qo5qKiGocHMeWXzKaBxyJ4lAFCgd4639c=
t3Udft6ta0WCoO2/jhQRy25AoiqWnd4jwKny1eomZEBAVm7aAwQZlZwpkDD3faiKXoZ1buFDSXK=
3dPL5U01wiE9LJDSM4mjPDDLgZPaSM/s6n2OmG0elPUHfW6qjZO1tp3CuvdIsz1NEsLLJTrF2kM=
gOOHE+k8seoge5A1YVo8U2+7NNZqyLb+2p6i1USUSyz0UhNVElKtJF5uJBkpCnBePH9TFuRORC7=
d69bmsHWuu65yWi0XC8XWuudfXUU8UgpJTcEmSdOKuHVeM8nHD5U8Tk40pgNkZrOawEBpsgS47N=
3VabRSX+6bbudLa684pK2akkSnqDkj8uQji/dW9j/hP0OmosF5MENSLTWeVUZ8qTyG4ye/6TjB/=
S3t9D9NWj1N8QFx6lbQt205Nn2myxUbUrObfLUeU601OYIFWGSRlj4ozcivdyQSew0bbR8Y112x=
ZbbZ4Ns3FBR2ansk0lFuKemCwwrgS00fFkp5nyfMkw5YMwXy8nQOYhLDb3XOXwFSoy0LgH6rjUp=
UbL3PS7Zpt4z2SqSx1tXJQwVxX8qSojUM8YP+kFYEj7jXZeyPHbaqm73C2bvo/wAAsNVR1k8Elo=
DSSU1RUU1wDQQlo8oPOuKsCQyoacEcw2dAG2vFttWyXKpu9dsGonqqu/7kvgVpaeohpZbpTpEjp=
FNEUd4PLUjmMNyfIGcaIy3w+YCR0Cw3dcxyWe5Q2+G6y0FQlHUSyQQztGRHJJGFLqrexKiRCQPb=
mv1GmnAg/POut7L4vunxpqGn3b0+q7kLTeb9dKCN6e3PShrhCqxyS0y08aO0MiBwqeWh5H6LikO=
pO6unu+9z3TdlFba+01FyvCyfCUdDTwUkNB5YDFI0ICzFwTxHowT3zoocFXIUFuOQM63XGQCP46=
Iq2m6fikrWtlzvxqhdQlEk9FCsbW3DZkkZZSVnzw/LVSmCx59gCpXW/YS013mte4rtJLFXpFaoK=
i2ohqKQ8uUszLKwicYX0LzyWPq7Z0y0godC4+X30qifUaKbjt/YlPHuGW1b+arNtqYorPHJa5Ym=
usLMQ8vuRBxAB4scnOB89PbhtLY1I24zbuqNDXLaUpza8WuriN4Z8eYIwyfk+Xk5MvHljtnOihI=
CEooSRnGnCU7dhjOr78NW99lbQ2P1RO6aTZlTXzWFTYob9bUqppa7zVXjCWU8cRtITgjuF79tdE=
bGvnhItlPbLTvO19Pb3Uz2OyUPxDSRxJR1kVuq5aud2QAOWqBHEeRwzNGc4A1PFe/fyj55FZxjl=
zn45hcBeScDsR21uI2UYwe3vr6TXe1+EuS4iKgpukdRb6eutqmdKqn8+aj/APSErKCqKuEURhcy=
gu5wBx0hXbK8G9FvNKSm2rsa62yvrbtUxj8b8sRUEFthNMcrKMGSpVlAY8suxx20oqZADPe/BKT=
Ek6b34r5whPoCNKovy4/11cvQq19MN9+ICgtvUGxR0mz6ye4VM1BBWNEkCJBNLHF536yoZVX3ye=
3cZ1V1+e1G93A2SmeCgNVKaWF5ObRxczwUt8yBgZ1ae0QNEszHemcQCkA5zqTpmyQFUkn5DUahG=
R3/AK6eQOBj20yVwCI7fOV7HuNFVouBRgAe2QT9tA1LUce41OUNZwYAk/fGjK56jJVrWm+GMY5E=
9s/tokp9wZ7o3fGqpobmQAA4x7amYrxxBXmT7aq1+i899C65fYj20pRvPFURyUihplZWjDAEFgR=
jOe2k2bvgj39tZGzrIPKALA+nIzk/trzAvoQrJ2Hd+pVp3nsO+UsFFHWU2445LX8eWWN6ktGwaT=
v2jOV7rj567Or+t/iVsG9rzQbs6G1N8lsN/oZilO1ylp4KukYqrRycm8xZAwxyyuCjAe2uJrM/U=
K83rZdOK6iMr3SjFtWdAqxymRo4/MwP0gwkftjXdm4ernixoupe3Nt3XbWzK26T1s01urqekrhR=
0MzVs1NKZJElAAeWlZiHDYBUjifYNAxOxAZfPL7QqEkNvuydJ42etMS21rv0Evx/DDHA5hqqqFZ=
pjEIwzgwNmVi6nJJyGAwSc6j9m+OHfW27Qls310ru9xuZ85RcyUiniqXepLzRRyU7RrLxl4nKkH=
yzkHJGrK314ifETsOggtm4ej1Te950NbCTdbNSzyWeogkUAIrglxKQ/wAwMMykADAI9YvFR4nKS=
CnuFx6A19THeqqqtNFzrpoqkVCROW8sSq5WVUkGHZcMVIAPcCpAzhRH5ULsvxjVe2p7LfdxdKdx=
VjVC3KC14qokp5KZrj8SqpGkC8mjZViPEqvFOyDJwl0d8SdRWblp7lH0u3LueotFJNWSNRL8dPD=
XVEpWecc8lUMIhhQZ9Cx8V/UdVtuDxY3vc09imvm1rqlz2ze7jXRY3FUQqkVS0pNP5YUFHTzOPP=
P6U4hVBOhXot1abo/WblvVLSVb3O52aSits0PlMtLU+bHNHM6yqwcK0S/LPfIIIB0rmWsNR6/HK=
yRrwTc7/a6h2X4p6faTeXedhdR7vd5Z4pKuaWzrGZ/LVQtL5SSBFwJ0y4XuJEyh7HUJcvG50Wul=
outDcOnd1natojBwko4Ss8BFQFt7kyk/Do0yOD3XK9o1wuBq4+OEVl5a601huFvkShuyRyRQ00j=
tWT0dDHS1D5xyaKekaXJ7kFF9h2pzo/vnpdtLa29bf1D2Yl6uV3tzRWaoe2QVJo6jg4DhpW/L9b=
JkqCcDsQQNAMtJG97yWdVM4QVfW/fFH0C3RtPdVqp9pVi3S6WCagikntaRNVSusxpASrEhabnEV=
LHGFyo9KDVb9CN0eGmn6YV22+slQ9JeRcaryJUtElVzpKhKaNjzjGVZPKkI7ggFuPdtSd76x+G7=
dpvd63Js6tlv10t1rgpn/A4FhoJaaBEZV8qZS4ZkGWYfoKoFAUZ1oOrXhjuNXuKzXLpzQWDblRe=
rdUQfD2+eaetoYZZjIO0uYHKSRAgMV9DnuSAIubiAtlfknBIdMgzZRF8n8MNvum65tsm0Vm3xfN=
uV1vpapa34mSiEZW4wRSPEsgVZHLYPEsij3xjW90sHhyvu8t0Wubce3qKx3HqTQPS1NurDC8Njk=
p6rzvI82LKrHJLAWGOGVwuQoOld0WHwxp0j3ZuuzmnlmLxWrbzxmqSskuK0NGWbyWbCw+ala5Z1=
wQyqpz6dB/Se4dFh0/pdsb9Sxx3G8b0gS6VdTTytU0tnjpvMBhkSL8nnMnlswkzh2yhABALbYhr=
7A7/MKjJmDH7I3+E+6n9GOk1h6FUvVvZE17q3u8lvgpme7QyQ0s8vmGanaMQK8pjWEjmGUcpB29=
BBjNh9Pek24ule3aW9z0lPfr3ebvJVVor4Y6qGClpBJTU8ayS8IxPIJIw0iYz3z2UM/uVl6EW66=
smybzaKyzjqDb0o5bjW5leyPTc5VdZFUrCshYMzYyex7rkky9JfC5drxTXJN+UkbVG46+omporz=
QrRGhjqa14aSOJiJI+ccNOBMx8vEw7k+nRmAM7c8x7LpYATpflkVW/XTpB016bUlOu1eoNTuKvr=
K2tWJRHTvTmGJmVx5sMpKyDCHBUBuWVPyBhsrpV4fb30xtUO8LZcKDc1x2lV3xLrBUO0KtFPPEB=
JGZcM4ApmWNVXIOSSGA0E9W9v9OrFf9zS7XloPIbfO4aagjpbks8a2xI1akKRqDgZkGJC5JxxwC=
pJi+ku0dg7n3jtW3X25XC8RXaWkpbla4YzStTxgHEvxDZUxpwUsAASnIAg4bVnjCAScvY/SFMyY=
gXhT3XXpdsLpvteW97Hrb/HVrvG87cpg0xMSR0FRULJJzH+nBNQquDkmOoOPbSFn8F29r9Ydk36=
l3BRK28oY5jEIXl+Bjmnpo4zIyZU8o6oS4BBVYpQQCpwZbF6AbDuO2tnXm77YvVRcq6q3TTXihh=
uiUzzvBPTQ06xni3lhI5KuXjhmk+GkGSB25w3JUvt+/XmyWC6VLUVJXmlpmWqbE0auyB8qQp5Du=
cdvV27aqAXdoZAkHzPoscLbuGeXkFbcng/eu2/t697e3xDJT11trbjdqmottUKejkprmtAIIxHG=
7O7SP7DPZWYgLgmrtl9GL/1A35X9PaW622gutG1VC71ryCKWYTpAI0aONyWMjjGVAwPcah7bvPc=
9keKa07pvdueBK94JKWvmjaNpSA/AIRxLqqhz/iAGc4A0pZLtf9t3+G7bc3JXUdZ8RTYrKaqZJF=
ZuEgAcEENyVT3Pun21rRvLVJiZIkb0Vo1vgg6w028LfsFq3axvlwVOVEt2XnSO4pQscw44DMauA=
KVyCcnOBnQ0nhf39TXNILtX7YokeiqK8TzXymWPEUCTeU7eYAjtFNDIAcEI4Y4AOJPY3iv68bIv=
g3pT7xq75cKW21EEL3uaSs+GUzQlpEVnA55gg/XyBCgEEAYED1x6s05tVXFvGu8/bscsVvaVUY0=
5kRQWwwPMmNVXk3IgKuD2ADtLNQmJpRaVIUXhr6hXyzWO87NoVvb3Las28aqCGSNPgqKK4TUXqd=
nAd2eEngvqAOMZVsJzeG7d0Nftm0G4WuSfdW1ardNK8MxdYKeCKaoeOTALczDByGBjMijPpbC1j=
8QHVCx2tNtbav8ADTW34ZbMKaWgp/KeiBNSsT8k9X57SuM5PKRznLHMbbOtO+rY9mHm0zm1Wmst=
VJKaSEzxUVVStSyR+YV5ECMsqgnC8iRgsTrdjfh98kss34/Sjoug3Vuto/xG27AvNZRyrzhmhpS=
4ePjHID2yR6ZYTj3/ADF/0hqH2h003Zv+a6JtGzy1sdooqq5VjAYWGmgiaViT9eKEAdyTgasSw+=
JnqdbZbZVUMNjJs5gqPKNCiieVJqFvMcAjkx/DaMEj/DGfmx0IdPOqN46XXq4XK02621f4jZqiy=
V1JcKdpYJoZxwmBCupB9iCD7gA5GQRAidZHlqi7q57Jtf6+0MXvZu59u0dBcL3t+42+mual6KWp=
pniSoTijcoywAYcXQ5HyYfXW7bM3XAtNNUbYu0cVXCainZqSQCaEKrGRCVwy8WU5HbDD66NeqXX=
LcnVa1Wm2XqzWWghtNRLUD8OjlQ1E701JTPLIJJHAJioqcAIFX0tgd+1oWrxu3+hulNcH2cUSGn=
p1kpKO+1sFPJPAlKiFYizLHEwo4hJEgHmAkM2AMKSQBHDmlIbJv+lzbJaLlGFZ7fUqrjKZiPcdu=
/t7YI/mNK3HbF9tdvt13uNrqKeiu8by0E8iYSoRJDG5Q/MB1Kn7jXYtl8fkdz5DdVpu9ppLJQsl=
mo7LdGjadlW3IlK8xQmOAmgkZ8K3MVDphf16A+lvip2X07aiqDsKvevis9wts9VHPSyiJ6i4rVq=
9PHNAyx4UPC3LllWyMYwWnszqlMB0Bc2VNnudHS0tdVUM8NPXK0lNLJGVWdVcoxQnswDKykj5gj=
5abcFCnIPLIP2xrrjbHi+6dR2bbNNvLpzPdbpt20V9npZ6ikt9bR08c9xWrSRKWSFQ0oj5wElwo=
B5BSS2qCqqvpffNzwXS6C+WujrrhW1FyjoqWBhT07Nyp1p0yq57kMDhR24/TRBtdCbwgeDyVlT4=
hGeMMCwVuJK/PBwcH74P7a8C+r09++iO0UGxKhrMl63DdqIT1cqXZ4Lak/wtOOPlyQgyp5znL5Q=
lAMD1HPbahtWyqmW2rV7rrKQVFwkgrna2c1pKMcOE68ZMyOcyZjAGOA9TcuxWkFD6D2GPbvpaMZ=
OiOisO0KmOhNRvuKlM12ahnEltnb4eh9JFaxUHkDyYeWuXHD7jSNZZrFS22oraHdtJW1EVyejip=
FpZ0kmpguVqwzIECE9uBYOCe6476OaEhRsSnAGDjTqNXxkcv3Or96Wbq2BReH+t2/dbT06m3JX7=
woaeGpu1tje50tuZOVROJnHaMMsSgZwB5uV7511dQp4E62trLXLbemDVVVcK+enrvj4qeCCmFfD=
HBHwDKnqg5OMkEAP27nUzVw6bv8IWmN6H3XzYAk1hDjGSTjX0ss3TnwYXO6o9/oum9LbpZ6qOb4=
bcUTSQrypRSBjHPjm3mzljHlcIATkZNW3bYPhw29tPeEs+wbNdrrZdrxXJDBuJ1MVdPW1CpCAjs=
GZYfLYgZ7RqCByzpmuxmO+OcKbqjW3O7SuIwCe5B1uvtjGri6E7W6V7gtPUW5dTKe4yix7ZlrrS=
tFOYyK3zFROXY8u7Dse2M5+WqhIAYY9v204M+np8pjnG92W8eSuMD+WlomK9yv7a0QqM5XGlEZe=
3px9DowsQndK5GOw1JU0xyfUc6iomVcsR7afU0gLA9j89AqTgiGkq2x2J+/y1JxVZXj2yfl30P0=
8g5dhj55Gnwnyf04Gfb6fbRzKi5oVMuVBA99acuI1jZz7ZOtGJOBke+uIL0U9tu8NwWie2S0NeY=
2tVVHVUpKKTHIjllOSO4DMxwe3c66VrfE31i3Buu3b2rN0lKqiYSCjpFNNRznz3nbzYYyFk5SSy=
M3L35Y9tcnscEH6HVs2x/Mp4iAAeA9v21VjQZkZqdVxAHcunD49ut7CJZ6La03lLJHHyt8g4xSt=
E0sQ4yD0sYIyT+od8EZ1AX3xZ753W9vfdOz9q16Wq7xXqgQx1cRp5Y4YokVSk4JTjBGTyySQe/c=
6o8sAffv7e2tlOcEk4GqYGnMLnxFEV73Hed3bhuG69w1a1Fzu9XJWVUgQIGkdskhRgAd/YfTSCy=
K2RjsDqPhcgAEjGPlp4jejI7986JUTwSjHPy/jrzkDnAz8tacvV3PzGvCeQ+mSPn8tKQpwlMJhm=
I5HHYAexx7nWkpAWRlVcHsfc/wCHIH7ZGtTjDYYYz8j9teE842VZD3cDAX/qHt9+/b+WNSLZKsx=
NqqEcTIwwwlKknAY/ljHb+H9dIrC+VCAhmnYEofY+UxPz+Xf6/PTtwroUCryeoxgtjK+X7Z/59/=
l8/IhzKGMcT8QxBHYjMDke37Z99MBCuJUXSU8jmDMgxxUeXj/qE40qkCxUiVEzIcUdLKoAHYtN2=
/kARj9tObagllt6StiMuqnHY48s/wC/SI9cEEZV8PRUQ9RGAQx/p9tZUBha10zyyyzBkUPVVBKk=
f6RCj39+7D+WmJRpGeCFUOVmXl9okOAP66czmSpVwwCZ8iRV+al5gD3/AHzpSrhWCWVOPAx1N1T=
JYD/AADn7HRAlHEoSpgqV4qpkRwtLjGR/fff7g/1OmT0c0/mF2jUKlSQT6QxiOB7dvn21I1E9UO=
IAkBEFKQ/mZH5XE5Gc+2B2/wDDTSoppPOkjmnDLyfAGOzTHsP2++jC03SElvkglELxI3OSkizn1=
ESoScD6Ef7PrpCWnrBGkxVHKxS1QAYFfyH4jsPftkffTuZUSdpApKhWdfVyx5HpyCOx9tefhjzA=
0xypV1p/YnAnUtj5fTWRTSqoKnzGpkgkRivwrZGAxkUOAe31JP8AAa0BjesjnkihWJpo5y5jJKx=
qODdu2Rn3/wDHTqCrqqecVRlkA5LVOWz28kcP9R9zpJw7RNRtEkvCnko09Bz5jt5ike/fv/LOhC=
ybCKmhpUnEhjlWmMgUxnvMspHc/LC574+331tVU1fRiooguYJpGt4cHIkZCsvv7e3D+GNPuNDNW=
OFgdEnrAYyuCGh8gj5j/TA/+LTOKlqJFgq6eZZh5IrHTOSJCTGSQR2PsfpjHz7ayyiTEZppGhmX=
/OJimMnJBHL+Wce/01k871R5VLEvI4l5DuAGGT7fM4HtpcxwxeakyFZIkVFOMZdSO+PpxPtnOe+=
m5pgvqVQ6CRoxx7HC4Pce/sfn9NELJu5BK8gM4DZHt3GQNaf/ALm7Yz2+RP8Ax1vITJIZW7l2LE=
gYBPuMYHbSeA/dictn74HyGisvCw9vfPz14yt7k62VO4Utx+eTr3j39+476wRXijBz99bepjlmJ=
P3OdbAEDHLAJyR8s/8AOdehO+P56YILTH9NbBGDYYEH6Y1sFOcaUEjhePYjHzGdFZJgY9tKrkds=
nXgU5+WlAO51kqUjJxkE40qkrDtk99Ig8u2lADnP9dZApysrEjLaUWQ/XTdBy9OQCO5yffSsf3H=
9NFZOFZiOzYyMHXqjv3zrxcE+2lovLLlZHZV4nBAyc47fP64/b76EoleBc+zfx0pGVOT7fw0mCF=
PYaVT7f6tFBLxnPY4/3aeQnC5x7fL56ZxnABBBzpzE5z799MkiVJQkgc8ZwRntp2r9sk+/b59tR=
8FSVQp6SCcn5acibtgYGfnpYSFqqnkUJYHv7aTxzI1ms1xhdgTGT3/jq1LKxNDBlRyMaH+GBrNZ=
q9PNSq5KTCgHPfuMftr3Cg4Gs1mqhc6dxEgqce/bS4Kj5HPzwdZrNKlK2HZgSoxknWpz2APsw/n=
nWazWSwsj4kqpHpLDP7a1pVLFAGbDuM4OPZT3/wCfvrNZqaq0LSFS1TFyJMglHYnIx5eSf6f0+e=
lIUkAhYH0NOCS3c/8AkzH/AFE/trNZogKwW1ojMUlE8i5wWPHPYH4bI/l76awDiKaPP6qOnx9MB=
GP+4azWaBRKTCNBSec0g7UltYLg4wZmPsPf2+f11H1RZ6mZnJdkqJcow9LeY2D8/oD/AE1ms1gg=
sgt0siGZjiIR14UZ/SEXAAH0yda1ppoOCIgKubawdQRgqnq7H55P7fsNZrNNCEpmPMkjK01MrKY=
a2JOXEY8yTOT9/lnP/HeW7VETM749dRT1JPft8OhRvY/Vv46zWaxTSkJo6urojAZoy4hkpOy+7T=
tzHc/LH8jpyLkFlaprrbSzJNUx1RY5VljjjCNgr7EkY9j7nt9M1msjMJjOiU1AQ9CYZltbo2JMg=
SCflke/+Egfx9/lrJrS73B4bZUs0dXWy0MYx5eIhGsoHb7n+n31ms0NUyZVRkrpUrZ4wqTlq5uA=
AwJAUwB+4H9e2ocU/lqjBwH8lW4nJy2Srd/276zWayCRliCS+Sw4mPCN88EdjrV0LBm4gKPSMdv=
Y/wDHWazRWWhRAcjOM/PWBM5ZQMDvj7azWaZAGVv5fb5fXH299ehew/fWazWRXoUcST7/AF1twy=
R9TrNZrapZW4T6ga2C6zWaMrLdF9s6U4Y9jkfI6zWaZArdV+Xz0rHgH399ZrNGLIJwi5BI+WlEC=
54kHWazSwiLrdDg5IHsf92lYkORgn9tZrNFZKIM50suVbI+us1miLoapZSQQVPf76UWRv04xj37=
6zWawSOzhf/Z" alt=3D"Selected photo" width=3D"400" height=3D"199" /></p>
<p><span style=3D"color: #000000; font-family: Times New Roman; font-size: =
medium;">I also tried doing these things:</span></p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">1. The 'rootfs' and 'bootfs' folders were merged into a single main fo=
lder and compressed into a zip file. Several methods were attempted to conv=
ert this zip file into an .iso file, including using online converters, com=
mand line tools, the 'any2iso' tool, and the Brasero tool. However, after c=
onverting and flashing the .iso file onto a Raspberry Pi, no partitions wer=
e detected.</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">2. In response to the lack of detected partitions, manual attempts wer=
e made to create two partitions for Root and Boot using the command line an=
d GParted tool. However, an issue arose when trying to load the 'rootfs' an=
d 'bootfs' files into their respective partitions.</p>
<p>&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">I am a newbie, and I really don't understand the file name systems and=
 things like dom0/dom1. I am trying from last 2 to 3 weeks to flash the ima=
ge but failing at it. Can someone please guide me what should I do once I h=
ave obtained the image through bitbaking?</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">Regards,<br />Shivansh</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>
<p style=3D"color: #000000; font-family: 'Times New Roman'; font-size: medi=
um;">&nbsp;</p>

--xrgGb2Zd3sYisV2zQ73E--

