Return-Path: <jmoreno@tierralunaengineering.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CD1C3DA7A
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 23:10:28 +0000 (UTC)
Subject: Using Docker containers on Yocto with RISC-V architecture #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: jmoreno@tierralunaengineering.com
X-Originating-Location: Rocklin, California, US (75.39.167.4)
X-Originating-Platform: Mac Safari 15.6
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 29 Dec 2022 15:10:26 -0800
Message-ID: <Sxe2.1672355426401088733.MABE@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="cXuy4jqSderLzqDYksoD"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Dec 2022 23:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7782

--cXuy4jqSderLzqDYksoD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am using Yocto on a RISC-V board, Microchip PolarFire Icicle Kit:
https://www.microsemi.com/ existing-parts/parts/152514 ( https://www.micros=
emi.com/existing-parts/parts/152514 )
(Board's Yocto directory: https://github.com/ polarfire-soc/meta-polarfire-=
 soc-yocto-bsp ( https://github.com/polarfire-soc/meta-polarfire-soc-yocto-=
bsp ) )

I would like to use docker containers with this OS and architecture. Seekin=
g advice with "meta-virtualization", is this feasible?

What I have done:

* I have added the "meta-virtualization" layer (pulled from git) and added =
them to "bblayers.conf".

* In "local.conf", I added the line:

* IMAGE_INSTALL +=3D "docker"

* After running bitbake, I get an error message:

| NOTE: make -j 32 cross-local
| cross-local
| -linkshared not supported on linux/riscv64
| make: *** [Makefile:85: cross-local] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/ubuntu/work/yocto/ yocto-dev/meta-virtualization/ recipe=
s-containers/docker/ docker-ce_git.bb:do_compile) failed with exit code '1'

Thanks,

Jonathan

--cXuy4jqSderLzqDYksoD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"caret-color: #222222; color: #222222; font-family: Arial, He=
lvetica, sans-serif; font-size: small;">Hello,</span>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">&nbsp;</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">I am using Yocto on a RISC-V board, Microchip PolarFir=
e Icicle Kit:</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;"><a style=3D"color: #1155cc;" href=3D"https://www.micro=
semi.com/existing-parts/parts/152514" target=3D"_blank" rel=3D"noopener" da=
ta-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://www.microsemi.=
com/existing-parts/parts/152514&amp;source=3Dgmail&amp;ust=3D16724414431820=
00&amp;usg=3DAOvVaw0EcXs_7Swa7g2psZP3KHf-">https://www.microsemi.com/<wbr /=
>existing-parts/parts/152514</a></div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">(Board's Yocto directory:&nbsp;<a style=3D"color: #115=
5cc;" href=3D"https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp=
" target=3D"_blank" rel=3D"noopener" data-saferedirecturl=3D"https://www.go=
ogle.com/url?q=3Dhttps://github.com/polarfire-soc/meta-polarfire-soc-yocto-=
bsp&amp;source=3Dgmail&amp;ust=3D1672441443182000&amp;usg=3DAOvVaw3Szzk8CGr=
hG25wHQ1uep0v">https://github.com/<wbr />polarfire-soc/meta-polarfire-<wbr =
/>soc-yocto-bsp</a>)</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">&nbsp;</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">I would like to use docker containers with this OS and=
 architecture. Seeking advice with "meta-virtualization", is this feasible?=
</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">&nbsp;</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">What I have done:</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">
<ul>
<li style=3D"margin-left: 15px;">I have added the "meta-virtualization" lay=
er (pulled from git) and added them to "bblayers.conf".</li>
</ul>
</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">
<ul>
<li style=3D"margin-left: 15px;">In "local.conf", I added the line:&nbsp;&n=
bsp;</li>
<ul>
<li style=3D"margin-left: 15px;">IMAGE_INSTALL&nbsp;<a id=3D"m_737485254568=
4304810m_997887478859842571plusReplyChip-0" class=3D"gmail_plusreply" style=
=3D"color: #222222;"></a>+=3D "docker"</li>
</ul>
<li style=3D"margin-left: 15px;">After running bitbake, I get an error mess=
age:</li>
</ul>
</div>
<span style=3D"caret-color: #222222; color: #222222; font-family: Arial, He=
lvetica, sans-serif; font-size: small;">| NOTE: make -j 32 cross-local</spa=
n><br style=3D"caret-color: #222222; color: #222222; font-family: Arial, He=
lvetica, sans-serif;" /><span style=3D"caret-color: #222222; color: #222222=
; font-family: Arial, Helvetica, sans-serif; font-size: small;">|&nbsp;</sp=
an><img class=3D"an1 CToWUd" style=3D"height: 1.2em; width: 1.2em; caret-co=
lor: #222222; color: #222222; font-family: Arial, Helvetica, sans-serif;" s=
rc=3D"https://fonts.gstatic.com/s/e/notoemoji/15.0/1f433/72.png" alt=3D"=F0=
=9F=90=B3" data-emoji=3D"=F0=9F=90=B3" aria-label=3D"=F0=9F=90=B3" data-bit=
=3D"iit" /><span style=3D"caret-color: #222222; color: #222222; font-family=
: Arial, Helvetica, sans-serif; font-size: small;">&nbsp;cross-local</span>=
<br style=3D"caret-color: #222222; color: #222222; font-family: Arial, Helv=
etica, sans-serif;" /><span style=3D"caret-color: #222222; color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;">| -linkshared=
 not supported on linux/riscv64</span><br style=3D"caret-color: #222222; co=
lor: #222222; font-family: Arial, Helvetica, sans-serif;" /><span style=3D"=
caret-color: #222222; color: #222222; font-family: Arial, Helvetica, sans-s=
erif; font-size: small;">| make: *** [Makefile:85: cross-local] Error 1</sp=
an><br style=3D"caret-color: #222222; color: #222222; font-family: Arial, H=
elvetica, sans-serif;" /><span style=3D"caret-color: #222222; color: #22222=
2; font-family: Arial, Helvetica, sans-serif; font-size: small;">| ERROR: o=
e_runmake failed</span><br style=3D"caret-color: #222222; color: #222222; f=
ont-family: Arial, Helvetica, sans-serif;" /><span style=3D"caret-color: #2=
22222; color: #222222; font-family: Arial, Helvetica, sans-serif; font-size=
: small;">| WARNING: exit code 1 from a shell command.</span><br style=3D"c=
aret-color: #222222; color: #222222; font-family: Arial, Helvetica, sans-se=
rif;" /><span style=3D"caret-color: #222222; color: #222222; font-family: A=
rial, Helvetica, sans-serif; font-size: small;">ERROR: Task (/home/ubuntu/w=
ork/yocto/</span><wbr style=3D"caret-color: #222222; color: #222222; font-f=
amily: Arial, Helvetica, sans-serif;" /><span style=3D"caret-color: #222222=
; color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: sma=
ll;">yocto-dev/meta-virtualization/</span><wbr style=3D"caret-color: #22222=
2; color: #222222; font-family: Arial, Helvetica, sans-serif;" /><span styl=
e=3D"caret-color: #222222; color: #222222; font-family: Arial, Helvetica, s=
ans-serif; font-size: small;">recipes-containers/docker/</span><wbr style=
=3D"caret-color: #222222; color: #222222; font-family: Arial, Helvetica, sa=
ns-serif;" /><span style=3D"caret-color: #222222; color: #222222; font-fami=
ly: Arial, Helvetica, sans-serif; font-size: small;">docker-ce_git.bb:do_co=
mpile) failed with exit code '1'</span>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">&nbsp;</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">Thanks,</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">&nbsp;</div>
<div style=3D"caret-color: #222222; color: #222222; font-family: Arial, Hel=
vetica, sans-serif;">Jonathan</div>

--cXuy4jqSderLzqDYksoD--

