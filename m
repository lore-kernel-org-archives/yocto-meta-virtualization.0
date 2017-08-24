Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D45C7E00BBC; Thu, 24 Aug 2017 06:59:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.66 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12C2BE00CA5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:29 -0700 (PDT)
Received: by mail-vk0-f66.google.com with SMTP id y189so1058681vkg.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XE/Y7T47ndSpGO86Hsmys8czI2TKwf3Qiq7z11ZtDK8=;
	b=W/u5NXhqv5AXe5Lt+CN7CqOvmVsL2o94fqpAe4Yl9w50cpel+37If+qBZ11u1AI8Tu
	NA6SoYuZKjABb0vkL5py4VfNg7qvI3yLeAxRZh1zVuTDmrisrn5DRSr9+eloo6DxyxfA
	dLCjQ+SEZcjwTk5G/0UV8KcnSr0843Nogj7+OknYl1s4PiEWr5n+o+0WJgW0vPfCTVqB
	2twQ1j5r5qULLOUW34twJ7ZTpjuPhu0eSp3HdkFz3M5GyZFLAiqiHj2UL60/O+380xfE
	NlRP71D6jbQzTX4YYItbBbOIVSdTi1VyCWZCSZ22t9rQplvQMhEnIUTXRi8CZdxTAQ4W
	yOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XE/Y7T47ndSpGO86Hsmys8czI2TKwf3Qiq7z11ZtDK8=;
	b=H7oaMV3obnvgUuduAGau9+UoCcrns6JHHv//lrC3VBqMAlBj3TGtV45c9P1qHgfgOL
	zEjeY1RtprwzANhpbB9D0rooHryn6ohfC/b0wpFQXmQWtbhulcMPXQuLROC2SS3BXrjo
	IjLy5rlf7DGdvJdNsF5OLbauSkSncaPWxA8MhPz7m0WY3PvC6tjcSbWXlwKSCS8j6oRV
	AFDYvx+LAj7gsRJ05TDlK0sAsWVAAlDI30FuvKj7Jr6gEpjusz6absBch8hq323yci8A
	+w1iAViaeESIFGe5VJp15lDOX7x/7A0NiX3JBRhjIFMiMp5Xjz4falwyBP3TF4vJvbaK
	1uaA==
X-Gm-Message-State: AHYfb5hJLPhPz6DMSLVMZBNTWbIOdBiZcutESaM6r+ByW5joQRmbVjfF
	b0rCBla2419YA9I7ItiQUhETpHea4Q==
X-Received: by 10.31.108.206 with SMTP id j75mr4530542vki.75.1503583169070;
	Thu, 24 Aug 2017 06:59:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:59:28 -0700 (PDT)
In-Reply-To: <1503516048-18645-1-git-send-email-mark.asselstine@windriver.com>
References: <1503516048-18645-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:59:28 -0400
Message-ID: <CADkTA4PWKZCir13ShjbSKQgDns2L8nyxCGA19OcTtrbdZD1M5g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] uwsgi: fixups for gcc 7.x
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
X-List-Received-Date: Thu, 24 Aug 2017 13:59:31 -0000
Content-Type: multipart/alternative; boundary="001a11478676aecdce0557803c7a"

--001a11478676aecdce0557803c7a
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 23, 2017 at 3:20 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Apply several upstream patches to fixup fallthrough switch
> statements. This fixes build failures such as:
>
> | core/hash.c:44:13: error: this statement may fall through
> [-Werror=implicit-fallthrough=]
> |            h ^= key[2] << 16;
> |            ~~^~~~~~~~~~~~~~~
> | core/hash.c:45:7: note: here
> |        case 2:
> |        ^~~~
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...icit-breaks-to-avoid-implicit-passthrough.patch | 50
> ++++++++++++++++++++++
>  ...icit-breaks-to-avoid-implicit-passthrough.patch | 50
> ++++++++++++++++++++++
>  meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb |  2 +
>  3 files changed, 102 insertions(+)
>  create mode 100644 meta-openstack/recipes-extended/uwsgi/files/Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
>  create mode 100644 meta-openstack/recipes-extended/uwsgi/files/more-Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
>
> diff --git a/meta-openstack/recipes-extended/uwsgi/files/Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> b/meta-openstack/recipes-extended/uwsgi/files/Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> new file mode 100644
> index 0000000..4b9c015
> --- /dev/null
> +++ b/meta-openstack/recipes-extended/uwsgi/files/Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> @@ -0,0 +1,50 @@
> +From 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 Mon Sep 17 00:00:00 2001
> +From: Paul Tagliamonte <paultag@gmail.com>
> +Date: Mon, 7 Aug 2017 11:18:56 -0400
> +Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
> +
> +commit 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 from upstream
> +git://github.com/unbit/uwsgi.git
> +
> +-Werror=implicit-fallthrough was added in gcc 7.1, which will
> +throw a compile error if a switch has an implicit passthrough.
> +
> +Seeing as how this switch doesn't appear to depend on passthrough to
> +function correctly, I've added explicit breaks to the switch.
> +
> +From https://gcc.gnu.org/gcc-7/changes.html:
> +
> +-Wimplicit-fallthrough warns when a switch case falls through. This
> +warning has five different levels. The compiler is able to parse a wide
> +range of fallthrough comments, depending on the level. It also handles
> +control-flow statements, such as ifs. It's possible to suppress the
> +warning by either adding a fallthrough comment, or by using a null
> +statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
> +(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
> +by -Wextra.
> +---
> + core/hash.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/core/hash.c b/core/hash.c
> +index a1288fa..9ae6bd2 100644
> +--- a/core/hash.c
> ++++ b/core/hash.c
> +@@ -42,11 +42,14 @@ static uint32_t murmur2_hash(char *key, uint64_t
> keylen) {
> +       switch (keylen) {
> +               case 3:
> +                       h ^= key[2] << 16;
> ++                      break;
> +               case 2:
> +                       h ^= key[1] << 8;
> ++                      break;
> +               case 1:
> +                       h ^= key[0];
> +                       h *= 0x5bd1e995;
> ++                      break;
> +       }
> +
> +       h ^= h >> 13;
> +--
> +2.7.4
> +
> diff --git a/meta-openstack/recipes-extended/uwsgi/files/more-Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> b/meta-openstack/recipes-extended/uwsgi/files/more-Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> new file mode 100644
> index 0000000..5a885ed
> --- /dev/null
> +++ b/meta-openstack/recipes-extended/uwsgi/files/more-Add-
> explicit-breaks-to-avoid-implicit-passthrough.patch
> @@ -0,0 +1,50 @@
> +From 54666237455273e147eadb1904d261ed7624a8b6 Mon Sep 17 00:00:00 2001
> +From: Paul Tagliamonte <tag@pault.ag>
> +Date: Mon, 14 Aug 2017 15:42:15 -0400
> +Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
> +
> +commit 54666237455273e147eadb1904d261ed7624a8b6 from upstream
> +git://github.com/unbit/uwsgi.git
> +
> +-Werror=implicit-fallthrough was added in gcc 7.1, which will
> +throw a compile error if a switch has an implicit passthrough.
> +
> +Seeing as how this switch doesn't appear to depend on passthrough to
> +function correctly, I've added explicit breaks to the switch.
> +
> +From https://gcc.gnu.org/gcc-7/changes.html:
> +
> +-Wimplicit-fallthrough warns when a switch case falls through. This
> +warning has five different levels. The compiler is able to parse a wide
> +range of fallthrough comments, depending on the level. It also handles
> +control-flow statements, such as ifs. It's possible to suppress the
> +warning by either adding a fallthrough comment, or by using a null
> +statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
> +(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
> +by -Wextra.
> +---
> + core/routing.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/core/routing.c b/core/routing.c
> +index 5887ec3..0cd6ea6 100644
> +--- a/core/routing.c
> ++++ b/core/routing.c
> +@@ -1792,10 +1792,10 @@ static int uwsgi_route_condition_ipv6in(struct
> wsgi_request *wsgi_req, struct uw
> +
> +       int i = (pfxlen / 32);
> +       switch (i) {
> +-      case 0: mask[0] = 0;
> +-      case 1: mask[1] = 0;
> +-      case 2: mask[2] = 0;
> +-      case 3: mask[3] = 0;
> ++      case 0: mask[0] = 0; break;
> ++      case 1: mask[1] = 0; break;
> ++      case 2: mask[2] = 0; break;
> ++      case 3: mask[3] = 0; break;
> +       }
> +
> +       if (pfxlen % 32)
> +--
> +2.7.4
> +
> diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> index dae288a..f0c535f 100644
> --- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> +++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 33ab1ce13e2312dddfad07f97f66321f"
>
>  SRCNAME = "uwsgi"
>  SRC_URI = "git://github.com/unbit/uwsgi.git;branch=uwsgi-2.0 \
> +    file://Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
> +    file://more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
>  "
>
>  SRCREV="af44211739136e22471a2897383f34586284bf86"
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

--001a11478676aecdce0557803c7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 23, 2017 at 3:20 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Apply several upstream patches t=
o fixup fallthrough switch<br>
statements. This fixes build failures such as:<br>
<br>
| core/hash.c:44:13: error: this statement may fall through [-Werror=3Dimpl=
icit-fallthrough=3D<wbr>]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h ^=3D key[2] &lt;&lt; 16;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~^~~~~~~~~~~~~~~<br>
| core/hash.c:45:7: note: here<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...icit-breaks-to-avoid-<wbr>implicit-passthrough.patch | 50 ++++++++=
++++++++++++++<br>
=C2=A0...icit-breaks-to-avoid-<wbr>implicit-passthrough.patch | 50 ++++++++=
++++++++++++++<br>
=C2=A0meta-openstack/recipes-<wbr>extended/uwsgi/<a href=3D"http://uwsgi_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">uwsgi_git.bb</a> |=C2=A0 2 +<br>
=C2=A03 files changed, 102 insertions(+)<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>extended/uwsgi/files/A=
dd-<wbr>explicit-breaks-to-avoid-<wbr>implicit-passthrough.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>extended/uwsgi/files/m=
ore-Add-<wbr>explicit-breaks-to-avoid-<wbr>implicit-passthrough.patch<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>extended/uwsgi/files/Add-<wbr>expl=
icit-breaks-to-avoid-<wbr>implicit-passthrough.patch b/meta-openstack/recip=
es-<wbr>extended/uwsgi/files/Add-<wbr>explicit-breaks-to-avoid-<wbr>implici=
t-passthrough.patch<br>
new file mode 100644<br>
index 0000000..4b9c015<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>extended/uwsgi/files/Add-<wbr>explicit-br=
eaks-to-avoid-<wbr>implicit-passthrough.patch<br>
@@ -0,0 +1,50 @@<br>
+From 0a14d0f0425f00421a69f0ca8e09a9<wbr>2cfdfc6a36 Mon Sep 17 00:00:00 200=
1<br>
+From: Paul Tagliamonte &lt;<a href=3D"mailto:paultag@gmail.com">paultag@gm=
ail.com</a>&gt;<br>
+Date: Mon, 7 Aug 2017 11:18:56 -0400<br>
+Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.<br>
+<br>
+commit 0a14d0f0425f00421a69f0ca8e09a9<wbr>2cfdfc6a36 from upstream<br>
+git://<a href=3D"http://github.com/unbit/uwsgi.git" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/unbit/uwsgi.<wbr>git</a><br>
+<br>
+-Werror=3Dimplicit-fallthrough was added in gcc 7.1, which will<br>
+throw a compile error if a switch has an implicit passthrough.<br>
+<br>
+Seeing as how this switch doesn&#39;t appear to depend on passthrough to<b=
r>
+function correctly, I&#39;ve added explicit breaks to the switch.<br>
+<br>
+From <a href=3D"https://gcc.gnu.org/gcc-7/changes.html" rel=3D"noreferrer"=
 target=3D"_blank">https://gcc.gnu.org/gcc-7/<wbr>changes.html</a>:<br>
+<br>
+-Wimplicit-fallthrough warns when a switch case falls through. This<br>
+warning has five different levels. The compiler is able to parse a wide<br=
>
+range of fallthrough comments, depending on the level. It also handles<br>
+control-flow statements, such as ifs. It&#39;s possible to suppress the<br=
>
+warning by either adding a fallthrough comment, or by using a null<br>
+statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];<br=
>
+(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled<b=
r>
+by -Wextra.<br>
+---<br>
+ core/hash.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/core/hash.c b/core/hash.c<br>
+index a1288fa..9ae6bd2 100644<br>
+--- a/core/hash.c<br>
++++ b/core/hash.c<br>
+@@ -42,11 +42,14 @@ static uint32_t murmur2_hash(char *key, uint64_t keyle=
n) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (keylen) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0h ^=3D key[2] &lt;&lt; 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0h ^=3D key[1] &lt;&lt; 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0h ^=3D key[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0h *=3D 0x5bd1e995;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0h ^=3D h &gt;&gt; 13;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta-openstack/recipes-<wbr>extended/uwsgi/files/more-Add-<wbr=
>explicit-breaks-to-avoid-<wbr>implicit-passthrough.patch b/meta-openstack/=
recipes-<wbr>extended/uwsgi/files/more-Add-<wbr>explicit-breaks-to-avoid-<w=
br>implicit-passthrough.patch<br>
new file mode 100644<br>
index 0000000..5a885ed<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>extended/uwsgi/files/more-Add-<wbr>explic=
it-breaks-to-avoid-<wbr>implicit-passthrough.patch<br>
@@ -0,0 +1,50 @@<br>
+From 54666237455273e147eadb1904d261<wbr>ed7624a8b6 Mon Sep 17 00:00:00 200=
1<br>
+From: Paul Tagliamonte &lt;<a href=3D"mailto:tag@pault.ag">tag@pault.ag</a=
>&gt;<br>
+Date: Mon, 14 Aug 2017 15:42:15 -0400<br>
+Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.<br>
+<br>
+commit 54666237455273e147eadb1904d261<wbr>ed7624a8b6 from upstream<br>
+git://<a href=3D"http://github.com/unbit/uwsgi.git" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/unbit/uwsgi.<wbr>git</a><br>
+<br>
+-Werror=3Dimplicit-fallthrough was added in gcc 7.1, which will<br>
+throw a compile error if a switch has an implicit passthrough.<br>
+<br>
+Seeing as how this switch doesn&#39;t appear to depend on passthrough to<b=
r>
+function correctly, I&#39;ve added explicit breaks to the switch.<br>
+<br>
+From <a href=3D"https://gcc.gnu.org/gcc-7/changes.html" rel=3D"noreferrer"=
 target=3D"_blank">https://gcc.gnu.org/gcc-7/<wbr>changes.html</a>:<br>
+<br>
+-Wimplicit-fallthrough warns when a switch case falls through. This<br>
+warning has five different levels. The compiler is able to parse a wide<br=
>
+range of fallthrough comments, depending on the level. It also handles<br>
+control-flow statements, such as ifs. It&#39;s possible to suppress the<br=
>
+warning by either adding a fallthrough comment, or by using a null<br>
+statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];<br=
>
+(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled<b=
r>
+by -Wextra.<br>
+---<br>
+ core/routing.c | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/core/routing.c b/core/routing.c<br>
+index 5887ec3..0cd6ea6 100644<br>
+--- a/core/routing.c<br>
++++ b/core/routing.c<br>
+@@ -1792,10 +1792,10 @@ static int uwsgi_route_condition_ipv6in(<wbr>struc=
t wsgi_request *wsgi_req, struct uw<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i =3D (pfxlen / 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (i) {<br>
+-=C2=A0 =C2=A0 =C2=A0 case 0: mask[0] =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 1: mask[1] =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 2: mask[2] =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 3: mask[3] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 case 0: mask[0] =3D 0; break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 1: mask[1] =3D 0; break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 2: mask[2] =3D 0; break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 3: mask[3] =3D 0; break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pfxlen % 32)<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta-openstack/recipes-<wbr>extended/uwsgi/<a href=3D"http://u=
wsgi_git.bb" rel=3D"noreferrer" target=3D"_blank">uwsgi_git.bb</a> b/meta-o=
penstack/recipes-<wbr>extended/uwsgi/<a href=3D"http://uwsgi_git.bb" rel=3D=
"noreferrer" target=3D"_blank">uwsgi_git.bb</a><br>
index dae288a..f0c535f 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/uwsgi/<a href=3D"http://uwsgi_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">uwsgi_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/uwsgi/<a href=3D"http://uwsgi_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">uwsgi_git.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>33ab1c=
e13e2312dddfad07f97f6632<wbr>1f&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;uwsgi&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/unbit/uwsgi.git;=
branch=3Duwsgi-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/unbit/u=
wsgi.<wbr>git;branch=3Duwsgi-2.0</a> \<br>
+=C2=A0 =C2=A0 file://Add-explicit-breaks-to-<wbr>avoid-implicit-passthroug=
h.<wbr>patch \<br>
+=C2=A0 =C2=A0 file://more-Add-explicit-<wbr>breaks-to-avoid-implicit-<wbr>=
passthrough.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV=3D&quot;<wbr>af44211739136e22471a2897383f34<wbr>586284bf86&quo=
t;<br>
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

--001a11478676aecdce0557803c7a--
