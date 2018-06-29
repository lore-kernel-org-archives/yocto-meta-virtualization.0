Return-Path: <alkis.mavridis@ciit.eu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37183E00E41; Fri, 29 Jun 2018 04:37:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45337E006B4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Jun 2018 04:36:59 -0700 (PDT)
Received: by mail-it0-f46.google.com with SMTP id p17-v6so2419808itc.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Jun 2018 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciit.eu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=3FAsm9CEi5MLXpG0bN6cYsAy490du8s679k4rkKbX0I=;
	b=PcIPo7hvjv3j5gxfzan7QeCVNUumnLHwhTntOx5csrU13cDz3zt7/L624lildHh8ya
	wN68iFC7dEgZWmv8iivjNCK/EfnqG/TYyEj06vzOfnrkEziHUmxs5ZwapyrH1DGO/NKg
	a8sf+2in1zgmcArHKPmnKW5zKCNkrKEOVHwjyar2P6gxKD/504wAxdhgFSybyY6LfRfF
	MVUJEUhihci2JUW0kj9wL3QM+A0Yu9y9MMj43QuYLSMiNI31DgkLyqbXPLp8yS/qUCAm
	d6n7Cchp8NbXB1cgMlS31OFY5vgA7/HliBKLCAvrPgik4iwcnBdnBdXHk6FKPQYfxcYS
	jYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3FAsm9CEi5MLXpG0bN6cYsAy490du8s679k4rkKbX0I=;
	b=h2h2GSIi8xo53m4rDO6bBz8/fN8uLFY73c8ox0ZWH2AZlyOCIxhyTPTEMHK5scoasx
	3XCHmBje23WEfdCjbrV8hT3w9k4/19T6g1z6k+5GghAbhyvEJBHcQ+nLFhyQvUIIJTV7
	QsrsrwD2fiXwESMRAo8xsVXO3QYc/9w7u87fqgLvaV0OJHTs5O99XiJLuE9BBKs5ASQv
	X66I0/XIuuqv/8oFzaBg1amowKqdDNMdLQip6M8qxHLEtjUZ125GDErQCKvv1zlVeoOz
	rhvWTL3BYaIslZq+rLRHLVq+MOjfIQoXbFpTVNn8eCf5r2d/KGhJ/b5SZpct7tg5lQ41
	Zezg==
X-Gm-Message-State: APt69E2A3BxUrwigt6X/ASwXoqupiQGuWB3GzmL/a7frNTEhvOi7U8vS
	Xq0kVgy3s6n1m2+NJralKlK0L/X4snF5WpR81dfL9Yx9
X-Google-Smtp-Source: AAOMgpeqxbYrPCvxwX7ytkj6ZqiPom9VRX5fxj7ITswtVcXK+9E2E1SrTH5N/AsJTVsDwmSCOwIdE3fDA2zxzYyzTsg=
X-Received: by 2002:a02:9bc1:: with SMTP id
	f1-v6mr12081783jal.90.1530272219196; 
	Fri, 29 Jun 2018 04:36:59 -0700 (PDT)
MIME-Version: 1.0
From: Alkis Mavridis <alkis.mavridis@ciit.eu>
Date: Fri, 29 Jun 2018 13:36:48 +0200
Message-ID: <CAK9s67mKekuUxN2ABfy10FJ4eueN1qVd44qWoUJ2JT8VeGk0Zw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Yocto sumo: including vmdk image leads to build errors
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
X-List-Received-Date: Fri, 29 Jun 2018 11:37:01 -0000
Content-Type: multipart/alternative; boundary="0000000000000905e7056fc64442"

--0000000000000905e7056fc64442
Content-Type: text/plain; charset="UTF-8"

Hello!
I am trying to build a linux image with docker installed (I user yocto
sumo).

Everything builds and runs successfully, until I add vmdk support to my
local.conf:
IMAGE_FSTYPES += "vmdk"

Then, I get the following errors:

=====================================
user@zenoUbuntu:~/yocto/sumo/build$ bitbake core-image-minimal
ERROR: /home/user/yocto/sumo/meta-virtualization/recipes-extended/images/
xen-image-minimal.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'vmdk' -
possibly invalid type name or missing support class
ERROR: /home/user/yocto/sumo/meta-virtualization/recipes-extended/images/
xen-guest-image-minimal.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
'vmdk' - possibly invalid type name or missing support class
ERROR: Failed to parse recipe:
/home/user/yocto/sumo/meta-virtualization/recipes-extended/images/
xen-image-minimal.bb
ERROR: /home/user/yocto/sumo/meta-virtualization/recipes-extended/images/
kvm-image-minimal.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'vmdk' -
possibly invalid type name or missing support class
ERROR: /home/user/yocto/sumo/meta-virtualization/recipes-extended/images/
cloud-image-guest.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'vmdk' -
possibly invalid type name or missing support class

Summary: There were 5 ERROR messages shown, returning a non-zero exit code.
======================================


Unfortunatelly, it will be very difficult for us to give up from  vmdk
support.
Is there any way to have both docker and vmdk?

PS: Vmdk was working in yocto morty without problems. But we needed a newer
version of docker, so we had moved to yocto sumo.

Thanks in advance!

--0000000000000905e7056fc64442
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">Hello!</span><div style=
=3D"color:rgb(80,0,80)">I am trying to build a linux image with docker inst=
alled (I user yocto sumo).</div><div style=3D"color:rgb(80,0,80)"><br></div=
><div style=3D"color:rgb(80,0,80)">Everything builds and runs successfully,=
 until I add vmdk support to my local.conf:</div><div style=3D"color:rgb(80=
,0,80)">IMAGE_FSTYPES +=3D &quot;vmdk&quot;<br></div><div style=3D"color:rg=
b(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)">Then, I get the fol=
lowing errors:<br></div><div style=3D"color:rgb(80,0,80)"><br></div><div st=
yle=3D"color:rgb(80,0,80)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div s=
tyle=3D"color:rgb(80,0,80)"><div>user@zenoUbuntu:~/yocto/sumo/build$ bitbak=
e core-image-minimal</div><div>ERROR: /home/user/yocto/sumo/meta-virtualiza=
tion/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb/" targe=
t=3D"_blank">xen-image-minimal.bb</a>: No IMAGE_CMD defined for IMAGE_FSTYP=
ES entry &#39;vmdk&#39; - possibly invalid type name or missing support cla=
ss</div><div>ERROR: /home/user/yocto/sumo/meta-virtualization/recipes-exten=
ded/images/<a href=3D"http://xen-guest-image-minimal.bb/" target=3D"_blank"=
>xen-guest-image-minimal.bb</a>: No IMAGE_CMD defined for IMAGE_FSTYPES ent=
ry &#39;vmdk&#39; - possibly invalid type name or missing support class</di=
v><div>ERROR: Failed to parse recipe: /home/user/yocto/sumo/meta-virtualiza=
tion/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb/" targe=
t=3D"_blank">xen-image-minimal.bb</a></div><div>ERROR: /home/user/yocto/sum=
o/meta-virtualization/recipes-extended/images/<a href=3D"http://kvm-image-m=
inimal.bb/" target=3D"_blank">kvm-image-minimal.bb</a>: No IMAGE_CMD define=
d for IMAGE_FSTYPES entry &#39;vmdk&#39; - possibly invalid type name or mi=
ssing support class</div><div>ERROR: /home/user/yocto/sumo/meta-virtualizat=
ion/recipes-extended/images/<a href=3D"http://cloud-image-guest.bb/" target=
=3D"_blank">cloud-image-guest.bb</a>: No IMAGE_CMD defined for IMAGE_FSTYPE=
S entry &#39;vmdk&#39; - possibly invalid type name or missing support clas=
s</div><div><br></div><div>Summary: There were 5 ERROR messages shown, retu=
rning a non-zero exit code.</div></div><div style=3D"color:rgb(80,0,80)">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div style=3D"color:rgb(80,0,8=
0)"><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div style=3D"col=
or:rgb(80,0,80)">Unfortunatelly, it will be very difficult for us to give u=
p from =C2=A0vmdk support.</div><div style=3D"color:rgb(80,0,80)">Is there =
any way to have both docker and vmdk?</div><div style=3D"color:rgb(80,0,80)=
"><br></div><div style=3D"color:rgb(80,0,80)">PS: Vmdk was working in yocto=
 morty without problems. But we needed a newer version of docker, so we had=
 moved to yocto sumo.</div><div style=3D"color:rgb(80,0,80)"><br></div><div=
 style=3D"color:rgb(80,0,80)">Thanks in advance!</div></div>

--0000000000000905e7056fc64442--
