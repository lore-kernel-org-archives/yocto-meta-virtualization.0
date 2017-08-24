Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71415E0090A; Thu, 24 Aug 2017 06:59:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E6F2E0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:13 -0700 (PDT)
Received: by mail-vk0-f49.google.com with SMTP id v15so2253316vkd.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4dA+XXvCzXylU+EzpdRP6IFv5VNAF15dD2qRhfqBTsU=;
	b=pHHS5IAaduvbw6JbyH5WcwG74e5MjHrnQqZYjCbletn9gL/dZqmfCnBO4FfTN2AgAg
	CcFBEMimuAKJVGgGXxjmppFWPDzy0UNl7jaKNgHJJZUNPIP7bSgql5aMiJKTXAwvlzvA
	1NpAIbJoaE7Z4TG0C4asA7J40ZCrcnqIaUp3g0WFsnZVwwBA1Qla+yttpCSl/84jJ+c4
	rxvkJZw+j7YEOXkOmaBPkqxX8tHQbTDkNxL1UJ6HE7TJd8MP/TOuBw3o1vTXitBSctLN
	mdGvUEycPrU3HH+Ciww2i4ETPel/FJrcjE8x9KUaUdxDnGCIZiGBZ08TlMfH97PrR3T/
	prhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4dA+XXvCzXylU+EzpdRP6IFv5VNAF15dD2qRhfqBTsU=;
	b=YH5uO4hICOROrEL9X/cxEZC7FX16tVunwzPHWi2qQf9HWlO56e3FqxwLWKYgjlUkr4
	/nt1ongwy07A3IM19XptQfNUgV1yvhy17VMkOR2/fRYaS0xFw887F3zapfzjo97xx/41
	qmjy86r7d0i+Hlvt6CFu86+fpeo8He1IwyeVQmwATYrnJi9kHzeIiFRHMYnxC92+aZ+U
	+TjHeSwEfjflV9Ij1UDNGTKkFqubeHUjDnnIV92w4hvcPs17v4/UJWnBrgmQSz27VNvp
	6dee3i8+XHF3Oow2DgEaAEJx+3bDFertPJ77uKISbwzFcHSY5rnLhtnCxkhGgosqV2Qm
	emtA==
X-Gm-Message-State: AHYfb5hJCrVaBp3gPjs0eIZf0kAws9bEnoIQ7Q+ux+xfSObdOrwtQZDX
	NfERmw5k0OCzZVTgUml0+SlaXYuSnA==
X-Received: by 10.31.198.135 with SMTP id w129mr3955663vkf.169.1503583153188; 
	Thu, 24 Aug 2017 06:59:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:59:12 -0700 (PDT)
In-Reply-To: <1503511685-14836-1-git-send-email-mark.asselstine@windriver.com>
References: <1503511685-14836-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:59:12 -0400
Message-ID: <CADkTA4NoxxJ_XjOC8ie3fLtNDwxaM_DEdUocBgEwtkuJim4beg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] spice: fix builds with gcc 7.x
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
X-List-Received-Date: Thu, 24 Aug 2017 13:59:15 -0000
Content-Type: multipart/alternative; boundary="001a114d5b04bc821b0557803b7d"

--001a114d5b04bc821b0557803b7d
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 23, 2017 at 2:08 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> There is an upstream fix for this issue but it doesn't apply cleanly
> and is rather simple so rather than backport it and turn it into
> something unrecognizeable I simply created my own version of it. This
> fixes builds which fail with:
>
> | ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_
> device':
> | ../../git/server/reds.c:797:31: error: this statement may fall through
> [-Werror=implicit-fallthrough=]
> |              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
> |              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../git/server/reds.c:798:9: note: here
> |          case VDI_PORT_READ_STATE_GET_BUFF: {
> |          ^~~~
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../spice/files/Fix-build-issues-with-gcc-7.patch  | 59
> ++++++++++++++++++++++
>  recipes-support/spice/spice_git.bb                 |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 recipes-support/spice/files/
> Fix-build-issues-with-gcc-7.patch
>
> diff --git a/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
> b/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
> new file mode 100644
> index 0000000..7fcafdc
> --- /dev/null
> +++ b/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
> @@ -0,0 +1,59 @@
> +From 9f001b6818ac4baa1df010ccf4200ca56bfb11b2 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Wed, 23 Aug 2017 13:47:29 -0400
> +Subject: [PATCH] Fix build issues with gcc 7
> +
> +gcc 7 checks for when a switch statement doesn't break between
> +cases. When a break is not found you will see
> +
> +| ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_
> device':
> +| ../../git/server/reds.c:797:31: error: this statement may fall through
> [-Werror=implicit-fallthrough=]
> +|              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
> +|              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +| ../../git/server/reds.c:798:9: note: here
> +|          case VDI_PORT_READ_STATE_GET_BUFF: {
> +|          ^~~~
> +
> +The 'fallthrough' comment will let gcc know this is done on purpose.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + server/inputs_channel.c | 1 +
> + server/reds.c           | 2 ++
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/server/inputs_channel.c b/server/inputs_channel.c
> +index 931dac1..534ab66 100644
> +--- a/server/inputs_channel.c
> ++++ b/server/inputs_channel.c
> +@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(RedChannelClient
> *rcc, uint32_t size, ui
> +             activate_modifiers_watch();
> +         }
> +     }
> ++        /* fallthrough */
> +     case SPICE_MSGC_INPUTS_KEY_UP: {
> +         SpiceMsgcKeyDown *key_down = (SpiceMsgcKeyDown *)buf;
> +         for (i = 0; i < 4; i++) {
> +diff --git a/server/reds.c b/server/reds.c
> +index 30d0652..8c80eb6 100644
> +--- a/server/reds.c
> ++++ b/server/reds.c
> +@@ -795,6 +795,7 @@ static SpiceCharDeviceMsgToClient
> *vdi_port_read_one_msg_from_device(SpiceCharDe
> +             }
> +             state->message_recive_len = state->vdi_chunk_header.size;
> +             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
> ++            /* fallthrough */
> +         case VDI_PORT_READ_STATE_GET_BUFF: {
> +             if (!(state->current_read_buf = vdi_port_read_buf_get())) {
> +                 return NULL;
> +@@ -806,6 +807,7 @@ static SpiceCharDeviceMsgToClient
> *vdi_port_read_one_msg_from_device(SpiceCharDe
> +             state->message_recive_len -= state->recive_len;
> +             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
> +         }
> ++            /* fallthrough */
> +         case VDI_PORT_READ_STATE_READ_DATA:
> +             n = sif->read(vdagent, state->recive_pos, state->recive_len);
> +             if (!n) {
> +--
> +2.7.4
> +
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/
> spice_git.bb
> index cfb75d7..04e7a25 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -37,6 +37,7 @@ SRC_URI += " \
>          file://build-allow-separated-src-and-build-dirs.patch \
>          file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
> \
>          file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
> \
> +        file://Fix-build-issues-with-gcc-7.patch \
>          "
>
>  S = "${WORKDIR}/git"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114d5b04bc821b0557803b7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 23, 2017 at 2:08 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">There is an upstream fix for thi=
s issue but it doesn&#39;t apply cleanly<br>
and is rather simple so rather than backport it and turn it into<br>
something unrecognizeable I simply created my own version of it. This<br>
fixes builds which fail with:<br>
<br>
| ../../git/server/reds.c: In function &#39;vdi_port_read_one_msg_from_<wbr=
>device&#39;:<br>
| ../../git/server/reds.c:797:<wbr>31: error: this statement may fall throu=
gh [-Werror=3Dimplicit-fallthrough=3D<wbr>]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;read_state =3D =
VDI_PORT_READ_STATE_GET_BUFF;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~^~~~~~~=
~~~~~<wbr>~~~~~~~~~~~~~~~~~~<br>
| ../../git/server/reds.c:798:9: note: here<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VDI_PORT_READ_STATE_GET_BUFF: {<br=
>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../spice/files/Fix-build-<wbr>issues-with-gcc-7.patch=C2=A0 | 59 +++=
+++++++++++++++++++<br>
=C2=A0recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 recipes-support/spice/files/<wbr>Fix-build-issues-=
with-gcc-7.<wbr>patch<br>
<br>
diff --git a/recipes-support/spice/files/<wbr>Fix-build-issues-with-gcc-7.<=
wbr>patch b/recipes-support/spice/files/<wbr>Fix-build-issues-with-gcc-7.<w=
br>patch<br>
new file mode 100644<br>
index 0000000..7fcafdc<br>
--- /dev/null<br>
+++ b/recipes-support/spice/files/<wbr>Fix-build-issues-with-gcc-7.<wbr>pat=
ch<br>
@@ -0,0 +1,59 @@<br>
+From 9f001b6818ac4baa1df010ccf4200c<wbr>a56bfb11b2 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Wed, 23 Aug 2017 13:47:29 -0400<br>
+Subject: [PATCH] Fix build issues with gcc 7<br>
+<br>
+gcc 7 checks for when a switch statement doesn&#39;t break between<br>
+cases. When a break is not found you will see<br>
+<br>
+| ../../git/server/reds.c: In function &#39;vdi_port_read_one_msg_from_<wb=
r>device&#39;:<br>
+| ../../git/server/reds.c:797:<wbr>31: error: this statement may fall thro=
ugh [-Werror=3Dimplicit-fallthrough=3D<wbr>]<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;read_state =3D=
 VDI_PORT_READ_STATE_GET_BUFF;<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~^~~~~~=
~~~~~~<wbr>~~~~~~~~~~~~~~~~~~<br>
+| ../../git/server/reds.c:798:9: note: here<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VDI_PORT_READ_STATE_GET_BUFF: {<b=
r>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
+<br>
+The &#39;fallthrough&#39; comment will let gcc know this is done on purpos=
e.<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ server/inputs_channel.c | 1 +<br>
+ server/reds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
+ 2 files changed, 3 insertions(+)<br>
+<br>
+diff --git a/server/inputs_channel.c b/server/inputs_channel.c<br>
+index 931dac1..534ab66 100644<br>
+--- a/server/inputs_channel.c<br>
++++ b/server/inputs_channel.c<br>
+@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(<wbr>RedChanne=
lClient *rcc, uint32_t size, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0activate_modifiers_watch()=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
+=C2=A0 =C2=A0 =C2=A0case SPICE_MSGC_INPUTS_KEY_UP: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SpiceMsgcKeyDown *key_down =3D (SpiceMsg=
cKeyDown *)buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i++) {<br>
+diff --git a/server/reds.c b/server/reds.c<br>
+index 30d0652..8c80eb6 100644<br>
+--- a/server/reds.c<br>
++++ b/server/reds.c<br>
+@@ -795,6 +795,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_m=
sg_from_<wbr>device(SpiceCharDe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;message_recive_l=
en =3D state-&gt;vdi_chunk_header.size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;read_state =3D V=
DI_PORT_READ_STATE_GET_BUFF;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VDI_PORT_READ_STATE_GET_BUFF: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(state-&gt;current_re=
ad_buf =3D vdi_port_read_buf_get())) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;=
<br>
+@@ -806,6 +807,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_m=
sg_from_<wbr>device(SpiceCharDe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;message_recive_l=
en -=3D state-&gt;recive_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;read_state =3D V=
DI_PORT_READ_STATE_READ_DATA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VDI_PORT_READ_STATE_READ_DATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D sif-&gt;read(vdagent=
, state-&gt;recive_pos, state-&gt;recive_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!n) {<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">spice_<wbr>git.bb</a> b/recipes-support/spice/=
<a href=3D"http://spice_git.bb" rel=3D"noreferrer" target=3D"_blank">spice_=
<wbr>git.bb</a><br>
index cfb75d7..04e7a25 100644<br>
--- a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
+++ b/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
@@ -37,6 +37,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://build-allow-separated-<wbr>src-and=
-build-dirs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-red_parse_qxl-Fix-<wbr>BITMAP=
_FMT_IS_RGB-defined-but-<wbr>not-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-PRI-macros-in-<wbr>printf=
-to-keep-compatibility-<wbr>betwe.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-build-issues-with-<wbr>gcc-7.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114d5b04bc821b0557803b7d--
