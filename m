Return-Path: <nesredin.mom@gmail.com>
Received: from mail-wi0-f193.google.com (mail-wi0-f193.google.com
	[209.85.212.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F948E006C2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 May 2013 08:04:38 -0700 (PDT)
Received: by mail-wi0-f193.google.com with SMTP id c10so403712wiw.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 May 2013 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=51MgeceW+UwNOaS6zRRKpuMKLU0e/ITrJ0wNiBjErYM=;
	b=HaATTteROI/1kW3aCAcQYbxdhxhpIjVxlslvpAl5zunG392jFF2nz1RGLhgVAtsJVX
	qDdLusAOlVkHaSo/Na7twTTpA1lFBpvOW8z6G3le+YpSN5NTBb5ZEvZ/iUrfK09Czl1q
	dlY7r0k8RRhVQ3N1Bf7S3jzyOasOy1DkhcMj6qJPFOpRlCfDzHh1G85KmFY8/40VSgCr
	YX9sX2/gYK/R8Da9TDJM3rWMUhwJsdUApFECuOO8V40sEZnPXx3L6f/dOxAQAc8dBNQ1
	xzBz4PaxcaCBqDp8OOcPTTzeywXxOqe2dkAbZGLbKsoVeMzmKHYqXQaMR9G95y69pE1T
	Bbpg==
MIME-Version: 1.0
X-Received: by 10.180.21.167 with SMTP id w7mr15750916wie.2.1369235075564;
	Wed, 22 May 2013 08:04:35 -0700 (PDT)
Received: by 10.194.21.106 with HTTP; Wed, 22 May 2013 08:04:35 -0700 (PDT)
Date: Wed, 22 May 2013 17:04:35 +0200
Message-ID: <CA+03FT_6uhdnKOQ2A_ThGqWL0_a88a4s=xVBx_P_sVuP0H=Liw@mail.gmail.com>
From: nesredin mohammedjemal Mahmud <nesredin.mom@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Bootable LVM using meta-intel sugarbay machine on XEN
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2013 15:04:38 -0000
X-Groupsio-MsgNum: 309
Content-Type: multipart/related; boundary=047d7b6d9a884b0b5804dd4fe257

--047d7b6d9a884b0b5804dd4fe257
Content-Type: multipart/alternative; boundary=047d7b6d9a884b0b5604dd4fe256

--047d7b6d9a884b0b5604dd4fe256
Content-Type: text/plain; charset=ISO-8859-1

hello everyone,

i am creating a bootable hard disk on a a logical volume using a custom
linux from meta-intel BSP, basically from core-image-sugarbay-fsroot.ext3.
After dumping the file to my LV, I tried to install grub using:

# grub-install --recheck --root-directory=/mnt/hvm /dev/ubuntu/hvm
Invalid device `/dev/ubuntu/hvm'.
Usage: /usr/sbin/grub-setup [OPTION...] DEVICE
Try `/usr/sbin/grub-setup --help' or `/usr/sbin/grub-setup --usage' for more
information.

even though, it returned error, it created me the bootloader on
device/boot/grub

then i created a grub.cfg inside the grub directory. And this is how it
looks like:

set default="0"
set timeout="50"

menuentry 'Yocto SDK' {
#       insmod part_msdos
        insmod ext2
        insmod lvm
        set root='(lvm/ubuntu)'
        linux /boot/bzImage root=ummlgG-XpET-RiC7-eyyd-IklG-SEjP-tt5SV8

}

whenever I try to boot from this guest machine using *hvmloader*, the error
message is as follows:

[image: Inline image 1]

Please can you point me out, where the problem is? I taught it was possible
to create a bootable LV. In fact this volume the third partition my LVG.

thank you,

nas

--047d7b6d9a884b0b5604dd4fe256
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>hello everyone,<br><br></div=
>i am creating a bootable hard disk on a a logical volume using a custom li=
nux from meta-intel BSP, basically from core-image-sugarbay-fsroot.ext3. Af=
ter dumping the file to my LV, I tried to install grub using:<br>
<br># grub-install --recheck --root-directory=3D/mnt/hvm /dev/ubuntu/hvm <b=
r>Invalid device `/dev/ubuntu/hvm&#39;.<br>Usage: /usr/sbin/grub-setup [OPT=
ION...] DEVICE<br>Try `/usr/sbin/grub-setup --help&#39; or `/usr/sbin/grub-=
setup --usage&#39; for more<br>
information.<br><br></div>even though, it returned error, it created me the=
 bootloader on device/boot/grub<br><br></div>then i created a grub.cfg insi=
de the grub directory. And this is how it looks like:<br><br>set default=3D=
&quot;0&quot;<br>
set timeout=3D&quot;50&quot;<br><br>menuentry &#39;Yocto SDK&#39; {<br>#=A0=
=A0=A0=A0=A0=A0 insmod part_msdos<br>=A0=A0=A0=A0=A0=A0=A0 insmod ext2<br>=
=A0=A0=A0=A0=A0=A0=A0 insmod lvm<br>=A0=A0=A0=A0=A0=A0=A0 set root=3D&#39;(=
lvm/ubuntu)&#39;<br>=A0=A0=A0=A0=A0=A0=A0 linux /boot/bzImage root=3DummlgG=
-XpET-RiC7-eyyd-IklG-SEjP-tt5SV8<br>
<br>}<br><br></div><div>whenever I try to boot from this guest machine usin=
g <b>hvmloader</b>, the error message is as follows:<br><br><img alt=3D"Inl=
ine image 1" src=3D"cid:ii_13eccc2225872895" height=3D"359" width=3D"564"><=
br></div>
<br>Please can you point me out, where the problem is? I taught it was poss=
ible to create a bootable LV. In fact this volume the third partition my LV=
G.<br><br></div>thank you,<br><br></div>nas<br><div><div><div><div><div>
<div><br><br></div></div></div></div></div></div></div>

--047d7b6d9a884b0b5604dd4fe256--

--047d7b6d9a884b0b5804dd4fe257
Content-Type: image/png; name="Screenshot from 2013-05-22 17:00:52.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_13eccc2225872895>
X-Attachment-Id: ii_13eccc2225872895

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
tu/czVZ6kAAAAABJRU5ErkJggg==

--047d7b6d9a884b0b5804dd4fe257--
