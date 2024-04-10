Return-Path: <tanski.piotr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E71CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 16:15:30 +0000 (UTC)
Subject: Raspberry Pi 4B's can0 on dom0
To: meta-virtualization@lists.yoctoproject.org
From: tanski.piotr@gmail.com
X-Originating-Location: =?UTF-8?B?xbt5cmFyZMOzdywgTWF6b3ZpYSwgUEw=?= (83.24.45.158)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 09:15:24 -0700
Message-ID: <q1PF.1712765724741010631.kptp@lists.yoctoproject.org>
Content-Type: multipart/mixed; boundary="IJH4SLmdB1LELAzvwMD8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Apr 2024 16:15:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8672

--IJH4SLmdB1LELAzvwMD8
Content-Type: multipart/alternative; boundary="PQ2zQNugbp5cbxbdaAC6"

--PQ2zQNugbp5cbxbdaAC6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I'm creating a custom OS based on Kirkstone.
I want to run it in dom0 on Raspberry Pi 4B device with Xen virtualization =
enabled. Therefore I include both meta-virtualization and meta-raspberrypi =
(Kirkstone branch for both).

I attach a PICAN-M HAT ( https://copperhilltech.com/blog/pican2-pican3-and-=
picanm-driver-installation-for-raspberry-pi/ ) to the Raspberry Pi 4B. I ex=
pect the OS to discover the CAN0 device in dom0, but it's not available :=
=C2=A0Cannot find device "can0".

Using meta-virtualization and meta-raspberrypi=C2=A0layers means that I'm a=
ctually using linux-yocto kernel and not linux-raspberrypi. I suspect that =
there's an issue with the device-tree / kernel configuration of linux-yocto=
. When I run e.g.=C2=A02023-08-04-OpenPlotter-v3-Starting-stable-64bit-img =
on this device, the problem disappears, i.e. can0 is available.

I know that CAN works via SPI converters on Raspberry Pi 4B, therefore I've=
 added the following lines to my boot/config.txt file that lies on the boot=
 partition on the SD card:
*dtparam=3Dspi=3Don
dtoverlay=3Dmcp2515-can0,oscillator=3D16000000,interrupt=3D25*

However, the can0 device still cannot be recognized.
Moreover, all SPIs are disabled in the /proc/device-tree when I check them =
with `cat spi\@7e204*/status`.

I tried to pull the device-tree file from the 2023-08-04-OpenPlotter-v3-Sta=
rting-stable-64bit-img, but the OS doesn't boot up.
I can see that the file from here: https://github.com/raspberrypi/linux/blo=
b/rpi-5.15.y/arch/arm/boot/dts/bcm2711-rpi-4-b.dts (the one I'd expect to c=
ompile) is completely different that I've got from the bitbake build direct=
ory:./tmp/work-shared/ raspberrypi4-64/kernel-source/ arch/arm/boot/dts/bcm=
2711-rpi- 4-b.dts.(File attached)

Even if I merge these lines:

>=20
> &spi0 {
> pinctrl-names =3D "default";
> pinctrl-0 =3D <&spi0_pins &spi0_cs_pins>;
> cs-gpios =3D <&gpio 8 1>, <&gpio 7 1>;
>=20
> spidev0: spidev@0{
> compatible =3D "spidev";
> reg =3D <0>; /* CE0 */
> #address-cells =3D <1>;
> #size-cells =3D <0>;
> spi-max-frequency =3D <125000000>;
> };
>=20
> spidev1: spidev@1{
> compatible =3D "spidev";
> reg =3D <1>; /* CE1 */
> #address-cells =3D <1>;
> #size-cells =3D <0>;
> spi-max-frequency =3D <125000000>;
> };
> };
>=20

+ include needed .dtsi files, it compiles, but it still doesn't work proper=
ly.

Is there any problem with the device-tree?
Do you have any suggestions how to make the OS to recognize CAN0 device fro=
m the HAT?

--PQ2zQNugbp5cbxbdaAC6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!<br /><br />I'm creating a custom OS based on Kirkstone.<br />I want to =
run it in dom0 on Raspberry Pi 4B device with Xen virtualization enabled. T=
herefore I include both meta-virtualization and meta-raspberrypi (Kirkstone=
 branch for both).<br /><br />I attach a PICAN-M HAT (<a href=3D"https://co=
pperhilltech.com/blog/pican2-pican3-and-picanm-driver-installation-for-rasp=
berry-pi/" target=3D"_blank" rel=3D"noopener">https://copperhilltech.com/bl=
og/pican2-pican3-and-picanm-driver-installation-for-raspberry-pi/</a>) to t=
he Raspberry Pi 4B. I expect the OS to discover the CAN0 device in dom0, bu=
t it's not available :&nbsp;Cannot find device "can0".<br /><br />Using met=
a-virtualization and meta-raspberrypi&nbsp;layers means that I'm actually u=
sing linux-yocto kernel and not linux-raspberrypi. I suspect that there's a=
n issue with the device-tree / kernel configuration of linux-yocto. When I =
run e.g.&nbsp;2023-08-04-OpenPlotter-v3-Starting-stable-64bit-img on this d=
evice, the problem disappears, i.e. can0 is available.<br /><br />I know th=
at CAN works via SPI converters on Raspberry Pi 4B, therefore I've added th=
e following lines to my boot/config.txt file that lies on the boot partitio=
n on the SD card:<br /><span style=3D"margin: 0px; padding: 0px; outline: n=
one; font-family: Arial, sans-serif; color: #4f81bd;"><strong style=3D"marg=
in: 0px; padding: 0px; outline: none;">dtparam=3Dspi=3Don<br style=3D"margi=
n: 0px; padding: 0px; outline: none;" />dtoverlay=3Dmcp2515-can0,oscillator=
=3D16000000,interrupt=3D25</strong></span><span style=3D"font-family: Arial=
, sans-serif;"><br /><br /></span>However, the can0 device still cannot be =
recognized.<br />Moreover, all SPIs are disabled in the /proc/device-tree w=
hen I check them with `cat spi\@7e204*/status`.<br /><br />I tried to pull =
the device-tree file from the 2023-08-04-OpenPlotter-v3-Starting-stable-64b=
it-img, but the OS doesn't boot up.<br />I can see that the file from here:=
&nbsp;<a href=3D"https://github.com/raspberrypi/linux/blob/rpi-5.15.y/arch/=
arm/boot/dts/bcm2711-rpi-4-b.dts" target=3D"_blank" rel=3D"noopener">https:=
//github.com/raspberrypi/linux/blob/rpi-5.15.y/arch/arm/boot/dts/bcm2711-rp=
i-4-b.dts</a>&nbsp;(the one I'd expect to compile) is completely different =
that I've got from the bitbake build directory:&nbsp;<span style=3D"color: =
#222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">./tm=
p/work-shared/</span><wbr style=3D"color: #222222; font-family: Arial, Helv=
etica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;">raspberrypi4-64/k=
ernel-source/</span><wbr style=3D"color: #222222; font-family: Arial, Helve=
tica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-=
family: Arial, Helvetica, sans-serif; font-size: small;">arch/arm/boot/dts/=
bcm2711-rpi-</span><wbr style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;">4-b.dts.(File attac=
hed)</span><br /><br />Even if I merge these lines:<br />
<blockquote>
<div>&amp;spi0 {</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>pinctrl-names =3D "default";</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>pinctrl-0 =3D &lt;&amp;spi0_pins &amp;spi0_cs_pins&gt;;</span></di=
v>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>cs-gpios =3D &lt;&amp;gpio 8 1&gt;, &lt;&amp;gpio 7 1&gt;;</span><=
/div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>spidev0: spidev@0{</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>compatible =3D "spidev";</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>reg =3D &lt;0&gt;;<span style=3D"white-space: pre;"> </span>/* CE0=
 */</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#address-cells =3D &lt;1&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#size-cells =3D &lt;0&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>spi-max-frequency =3D &lt;125000000&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>};</span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>spidev1: spidev@1{</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>compatible =3D "spidev";</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>reg =3D &lt;1&gt;;<span style=3D"white-space: pre;"> </span>/* CE1=
 */</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#address-cells =3D &lt;1&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#size-cells =3D &lt;0&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>spi-max-frequency =3D &lt;125000000&gt;;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>};</span></div>
<div>};</div>
</blockquote>
<div>+ include needed .dtsi files, it compiles, but it still doesn't work p=
roperly.<br /><br />Is there any problem with the device-tree?<br />Do you =
have any suggestions how to make the OS to recognize CAN0 device from the H=
AT?</div>

--PQ2zQNugbp5cbxbdaAC6--

--IJH4SLmdB1LELAzvwMD8
Content-Type: application/octet-stream; name="bcm2711-rpi-4-b.dts"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bcm2711-rpi-4-b.dts"

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCi9kdHMtdjEvOw0KI2luY2x1ZGUg
ImJjbTI3MTEuZHRzaSINCiNpbmNsdWRlICJiY20yNzExLXJwaS5kdHNpIg0KI2luY2x1ZGUgImJj
bTI4M3gtcnBpLXVzYi1wZXJpcGhlcmFsLmR0c2kiDQoNCi8gew0KICAgICAgICBjb21wYXRpYmxl
ID0gInJhc3BiZXJyeXBpLDQtbW9kZWwtYiIsICJicmNtLGJjbTI3MTEiOw0KICAgICAgICBtb2Rl
bCA9ICJSYXNwYmVycnkgUGkgNCBNb2RlbCBCIjsNCg0KICAgICAgICBjaG9zZW4gew0KICAgICAg
ICAgICAgICAgIC8qIDgyNTAgYXV4aWxpYXJ5IFVBUlQgaW5zdGVhZCBvZiBwbDAxMSAqLw0KICAg
ICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDE6MTE1MjAwbjgiOw0KICAgICAgICB9
Ow0KDQogICAgICAgIGxlZHMgew0KICAgICAgICAgICAgICAgIGxlZC1hY3Qgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JmdwaW8gNDIgR1BJT19BQ1RJVkVfSElHSD47DQogICAg
ICAgICAgICAgICAgfTsNCg0KICAgICAgICAgICAgICAgIGxlZC1wd3Igew0KICAgICAgICAgICAg
ICAgICAgICAgICAgbGFiZWwgPSAiUFdSIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGdwaW9z
ID0gPCZleHBncGlvIDIgR1BJT19BQ1RJVkVfTE9XPjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGRlZmF1bHQtc3RhdGUgPSAia2VlcCI7DQogICAgICAgICAgICAgICAgICAgICAgICBsaW51eCxk
ZWZhdWx0LXRyaWdnZXIgPSAiZGVmYXVsdC1vbiI7DQogICAgICAgICAgICAgICAgfTsNCiAgICAg
ICAgfTsNCg0KICAgICAgICB3aWZpX3B3cnNlcTogd2lmaS1wd3JzZXEgew0KICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAibW1jLXB3cnNlcS1zaW1wbGUiOw0KICAgICAgICAgICAgICAgIHJl
c2V0LWdwaW9zID0gPCZleHBncGlvIDEgR1BJT19BQ1RJVkVfTE9XPjsNCiAgICAgICAgfTsNCg0K
ICAgICAgICBzZF9pb18xdjhfcmVnOiBzZF9pb18xdjhfcmVnIHsNCiAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInJlZ3VsYXRvci1ncGlvIjsNCiAgICAgICAgICAgICAgICByZWd1bGF0b3It
bmFtZSA9ICJ2ZGQtc2QtaW8iOw0KICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDE4MDAwMDA+Ow0KICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDMzMDAwMDA+Ow0KICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KICAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb247DQogICAgICAgICAgICAgICAgcmVndWxhdG9y
LXNldHRsaW5nLXRpbWUtdXMgPSA8NTAwMD47DQogICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JmV4
cGdwaW8gNCBHUElPX0FDVElWRV9ISUdIPjsNCiAgICAgICAgICAgICAgICBzdGF0ZXMgPSA8MTgw
MDAwMCAweDE+LA0KICAgICAgICAgICAgICAgICAgICAgICAgIDwzMzAwMDAwIDB4MD47DQogICAg
ICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KICAgICAgICB9Ow0KDQogICAgICAgIHNkX3Zj
Y19yZWc6IHNkX3ZjY19yZWcgew0KICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxh
dG9yLWZpeGVkIjsNCiAgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2Y2Mtc2QiOw0K
ICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KICAg
ICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KICAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KICAgICAgICAgICAgICAgIGVuYWJsZS1hY3Rp
dmUtaGlnaDsNCiAgICAgICAgICAgICAgICBncGlvID0gPCZleHBncGlvIDYgR1BJT19BQ1RJVkVf
SElHSD47DQogICAgICAgIH07DQp9Ow0KDQomZGRjMCB7DQogICAgICAgIHN0YXR1cyA9ICJva2F5
IjsNCn07DQoNCiZkZGMxIHsNCiAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KJmV4cGdw
aW8gew0KICAgICAgICBncGlvLWxpbmUtbmFtZXMgPSAiQlRfT04iLA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAiV0xfT04iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiUFdSX0xFRF9P
RkYiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR0xPQkFMX1JFU0VUIiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIlZERF9TRF9JT19TRUwiLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAiQ0FNX0dQSU8iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiU0RfUFdSX09OIiwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIiI7DQp9Ow0KDQomZ3BpbyB7DQogICAgICAgIC8q
DQogICAgICAgICAqIFBhcnRzIHRha2VuIGZyb20gcnBpX1NDSF80Yl80cDBfcmVkdWNlZC5wZGYg
YW5kDQogICAgICAgICAqIHRoZSBvZmZpY2lhbCBHUFUgZmlybXdhcmUgRFQgYmxvYi4NCiAgICAg
ICAgICoNCiAgICAgICAgICogTGVnZW5kOg0KICAgICAgICAgKiAiRk9PIiA9IEdQSU8gbGluZSBu
YW1lZCAiRk9PIiBvbiB0aGUgc2NoZW1hdGljDQogICAgICAgICAqICJGT09fTiIgPSBHUElPIGxp
bmUgbmFtZWQgIkZPTyIgb24gc2NoZW1hdGljLCBhY3RpdmUgbG93DQogICAgICAgICAqLw0KICAg
ICAgICBncGlvLWxpbmUtbmFtZXMgPSAiSURfU0RBIiwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIklEX1NDTCIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJTREExIiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIlNDTDEiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJ
T19HQ0xLIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIkdQSU81IiwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIkdQSU82IiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIlNQSV9D
RTFfTiIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJTUElfQ0UwX04iLA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAiU1BJX01JU08iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAi
U1BJX01PU0kiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiU1BJX1NDTEsiLA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAiR1BJTzEyIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IkdQSU8xMyIsDQogICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFNlcmlhbCBwb3J0ICovDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICJUWEQxIiwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIlJYRDEiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJTzE2IiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIkdQSU8xNyIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJH
UElPMTgiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJTzE5IiwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIkdQSU8yMCIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJHUElP
MjEiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJTzIyIiwNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIkdQSU8yMyIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJHUElPMjQi
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiR1BJTzI1IiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIkdQSU8yNiIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJHUElPMjciLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAiUkdNSUlfTURJTyIsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICJSR01JT19NREMiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBVc2Vk
IGJ5IEJUIG1vZHVsZSAqLw0KICAgICAgICAgICAgICAgICAgICAgICAgICAiQ1RTMCIsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICJSVFMwIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IlRYRDAiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiUlhEMCIsDQogICAgICAgICAgICAg
ICAgICAgICAgICAgIC8qIFVzZWQgYnkgV2lmaSAqLw0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAiU0QxX0NMSyIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJTRDFfQ01EIiwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlNEMV9EQVRBMCIsDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICJTRDFfREFUQTEiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiU0QxX0RBVEEyIiwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIlNEMV9EQVRBMyIsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIFNoYXJlZCB3aXRoIFNQSSBmbGFzaCAqLw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAiUFdNMF9NSVNPIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIlBXTTFfTU9T
SSIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJTVEFUVVNfTEVEX0dfQ0xLIiwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlNQSUZMQVNIX0NFX04iLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAiU0RBMCIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJTQ0wwIiwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlJHTUlJX1JYQ0xLIiwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIlJHTUlJX1JYQ1RMIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIlJHTUlJX1JY
RDAiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiUkdNSUlfUlhEMSIsDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICJSR01JSV9SWEQyIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IlJHTUlJX1JYRDMiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAiUkdNSUlfVFhDTEsiLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAiUkdNSUlfVFhDVEwiLA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAiUkdNSUlfVFhEMCIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICJSR01J
SV9UWEQxIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIlJHTUlJX1RYRDIiLA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAiUkdNSUlfVFhEMyI7DQp9Ow0KDQomaGRtaTAgew0KICAgICAg
ICBzdGF0dXMgPSAib2theSI7DQp9Ow0KDQomaGRtaTEgew0KICAgICAgICBzdGF0dXMgPSAib2th
eSI7DQp9Ow0KDQomcGl4ZWx2YWx2ZTAgew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0K
DQomcGl4ZWx2YWx2ZTEgew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0KDQomcGl4ZWx2
YWx2ZTIgew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0KDQomcGl4ZWx2YWx2ZTQgew0K
ICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0KDQomcHdtMSB7DQogICAgICAgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7DQogICAgICAgIHBpbmN0cmwtMCA9IDwmcHdtMV8wX2dwaW80MCAm
cHdtMV8xX2dwaW80MT47DQogICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCn07DQoNCi8qIFNESENJ
IGlzIHVzZWQgdG8gY29udHJvbCB0aGUgU0RJTyBmb3Igd2lyZWxlc3MgKi8NCiZzZGhjaSB7DQog
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsN
CiAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgICAgICAgcGluY3RybC0wID0g
PCZlbW1jX2dwaW8zND47DQogICAgICAgIGJ1cy13aWR0aCA9IDw0PjsNCiAgICAgICAgbm9uLXJl
bW92YWJsZTsNCiAgICAgICAgbW1jLXB3cnNlcSA9IDwmd2lmaV9wd3JzZXE+Ow0KICAgICAgICBz
dGF0dXMgPSAib2theSI7DQoNCiAgICAgICAgYnJjbWY6IHdpZmlAMSB7DQogICAgICAgICAgICAg
ICAgcmVnID0gPDE+Ow0KICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYnJjbSxiY200MzI5
LWZtYWMiOw0KICAgICAgICB9Ow0KfTsNCg0KLyogRU1NQzIgaXMgdXNlZCB0byBkcml2ZSB0aGUg
U0QgY2FyZCAqLw0KJmVtbWMyIHsNCiAgICAgICAgdnFtbWMtc3VwcGx5ID0gPCZzZF9pb18xdjhf
cmVnPjsNCiAgICAgICAgdm1tYy1zdXBwbHkgPSA8JnNkX3ZjY19yZWc+Ow0KICAgICAgICBicm9r
ZW4tY2Q7DQogICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCn07DQoNCiZnZW5ldCB7DQogICAgICAg
IHBoeS1oYW5kbGUgPSA8JnBoeTE+Ow0KICAgICAgICBwaHktbW9kZSA9ICJyZ21paS1yeGlkIjsN
CiAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KJmdlbmV0X21kaW8gew0KICAgICAgICBw
aHkxOiBldGhlcm5ldC1waHlAMSB7DQogICAgICAgICAgICAgICAgLyogTm8gUEhZIGludGVycnVw
dCAqLw0KICAgICAgICAgICAgICAgIHJlZyA9IDwweDE+Ow0KICAgICAgICB9Ow0KfTsNCg0KJnBj
aWUwIHsNCiAgICAgICAgcGNpQDAsMCB7DQogICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAi
cGNpIjsNCiAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsNCiAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCiAgICAgICAgICAgICAgICByYW5nZXM7DQoNCiAgICAg
ICAgICAgICAgICByZWcgPSA8MCAwIDAgMCAwPjsNCg0KICAgICAgICAgICAgICAgIHVzYkAwLDAg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMCAwIDAgMD47DQogICAgICAgICAg
ICAgICAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IFJBU1BCRVJSWVBJX0ZJUk1XQVJFX1JFU0VU
X0lEX1VTQj47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgfTsNCn07DQoNCi8qIHVhcnQw
IGNvbW11bmljYXRlcyB3aXRoIHRoZSBCVCBtb2R1bGUgKi8NCiZ1YXJ0MCB7DQogICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogICAgICAgIHBpbmN0cmwtMCA9IDwmdWFydDBfY3Rz
cnRzX2dwaW8zMCAmdWFydDBfZ3BpbzMyPjsNCiAgICAgICAgdWFydC1oYXMtcnRzY3RzOw0KICAg
ICAgICBzdGF0dXMgPSAib2theSI7DQoNCiAgICAgICAgYmx1ZXRvb3RoIHsNCiAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImJyY20sYmNtNDM0MzgtYnQiOw0KICAgICAgICAgICAgICAgIG1h
eC1zcGVlZCA9IDwyMDAwMDAwPjsNCiAgICAgICAgICAgICAgICBzaHV0ZG93bi1ncGlvcyA9IDwm
ZXhwZ3BpbyAwIEdQSU9fQUNUSVZFX0hJR0g+Ow0KICAgICAgICB9Ow0KfTsNCg0KLyogdWFydDEg
aXMgbWFwcGVkIHRvIHRoZSBwaW4gaGVhZGVyICovDQomdWFydDEgew0KICAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KICAgICAgICBwaW5jdHJsLTAgPSA8JnVhcnQxX2dwaW8xND47
DQogICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCn07DQoNCiZ2YzQgew0KICAgICAgICBzdGF0dXMg
PSAib2theSI7DQp9Ow0KDQomdmVjIHsNCiAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCn07

--IJH4SLmdB1LELAzvwMD8--

