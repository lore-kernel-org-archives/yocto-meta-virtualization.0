Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03053E00CBC; Thu, 26 Sep 2019 07:34:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4742AE0096F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:34:29 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id u3so1876863lfl.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T5SaqUd0xH/TlqCAieW5vVbzz4FnWhtVUYl95fL4CZw=;
	b=fjz4wgmsg4uAa7ZV1bmJYwAFHTsByjkPnGiK/QSpBlAJRIYun02Gyc+NfRtxt4Aly5
	Sil9To4R/SrDSEjwWEJDbTPD7LoKkYv6Rdbk9FBdkDQ4mnAs+Zrg3BoxiDPrKw0Haa5t
	B3tZlfnDKZMPiIk/dm8cJf3xHeZLhTwHa4yy7iAYiIkoS2vZhSLJcJwymMkvlLNLmFwS
	fOQx720FpUIRiRGgENZWw7pb6mnapNvAFL4gi05kX6jtl/dgPGyUIt+T3rHXRmBFRQ64
	+nnEsQJzFpNnYnR6Am/r05fzI1eJ+j2+tVUgZ1/YhAi/CfE5YhzRwoqGUqFJLbVVJ709
	Wwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T5SaqUd0xH/TlqCAieW5vVbzz4FnWhtVUYl95fL4CZw=;
	b=jzlFrUb7iLtEihcMZ4BYghQHn0lsk5WpxtXs8ljhmP6FVQkTtzKCQjpxz/wgyAgMP7
	XghIC6z0xyBpn/rwgs8xViwRNBkuwtnZYEaa/8ohnnxpfO2w2OAtKXDdTB79eqWP5NBq
	trm/TwmFN6ZQDMXIlk6PjnmxNxFzAFdObleAGFs/1ZEz5X9dy93mUcbPoPj6Uy1GtprW
	KBk01ZHgqPs9XlzjlrtcHmVb3cRH9j9pEIgNUFbuCYmULIU5gY6iZrP/H/iEgyM8OQOm
	mNP8vy1P2o3v4+e5M9oSXQDRp5E5dm1nlHcf7F5WQusiSwhCbhKzPx9pl5Cq9HjSdYJH
	g91g==
X-Gm-Message-State: APjAAAWdTqNDlb8Cthbgl6En+8CGL2cvqBHlBswgKWHu58mWQ9lhSbTQ
	aoWH1L/4Z4zM4yybdrod+k9wkwVk3Jj4r5xJfcs=
X-Google-Smtp-Source: APXvYqwtKQ+UgInhX57IbXaOfS0UJdGqBe2DhVKOvnDJa9eTAx2dBRu5qVCFUfpRxgERbG3rOUENoVDshJJYXcr+b8s=
X-Received: by 2002:a19:c80b:: with SMTP id y11mr2544666lff.184.1569508467973; 
	Thu, 26 Sep 2019 07:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
	<CADkTA4OWtpRXJV0bJAbt9xO4oCte0DVyiO55-GGh=fqPucU2nQ@mail.gmail.com>
	<47fbd63a-708b-cafa-b4c8-e73924be3156@gmail.com>
	<2d93272d-08a1-f6fa-d24d-cfc20e63d862@windriver.com>
In-Reply-To: <2d93272d-08a1-f6fa-d24d-cfc20e63d862@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Sep 2019 10:34:16 -0400
Message-ID: <CADkTA4Orw9HAo+ajq7wPxUMAQbh0MP3E3ZbRBTiE3TBoZLzRQQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc
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
X-List-Received-Date: Thu, 26 Sep 2019 14:34:31 -0000
Content-Type: multipart/alternative; boundary="000000000000b4a229059375aa6f"

--000000000000b4a229059375aa6f
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 10:03 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> On 9/4/19 2:28 AM, akuster808 wrote:
> >
> > On 9/3/19 10:40 AM, Bruce Ashfield wrote:
> >> On Tue, Sep 3, 2019 at 4:02 AM Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
> >>> Backport a patch from upstream to fix CVE-2019-14271
> >> Given the docker version bumps that Stefan posted earlier, is this
> >> still required ?
> In Stefan upgraded patch earlier, it switched from moby:master to
> engine:19.03,
>
> I found the upgraded version contains the patch
>
> commit fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b
> Author: Justin Cormack <justin.cormack@docker.com>
> Date:   Thu Jul 25 15:24:39 2019 +0100
>
>      Initialize nss libraries in Glibc so that the dynamic libraries are
> loaded in the host
>      environment not in the chroot from untrusted files.
>
>      See also OpenVZ
>
> https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
>
>      Signed-off-by: Justin Cormack <justin.cormack@docker.com>
>      (cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
>      Signed-off-by: Tibor Vass <tibor@docker.com>
>
> $ git branch -r --contains fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b
>    origin/19.03
>
> If Stefan's patch is accepted, please ignore this one
>
> //Hongxu
>
> > What about stable branches? can this be reused for any of them?
>
> I am afraid it exists on master branch only
>
> jia@pek-lpg-core1-vm2:/buildarea1/hjia/community/moby$ git branch -r
> --contains a316b10dab79d9298b02c7930958ed52e0ccf4e4
>    origin/HEAD -> origin/master
>    origin/master
>
>
>
FYI: I just pushed changes to master that should address this (and the
other docker uprevs that were pending).

Bruce



>
>
> > - armin
> >> Bruce
> >>
> >>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> ---
> >>>   recipes-containers/docker/docker_git.bb            |  1 +
> >>>   ...nss-libraries-in-Glibc-so-that-the-dynami.patch | 50
> ++++++++++++++++++++++
> >>>   2 files changed, 51 insertions(+)
> >>>   create mode 100644
> recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> >>>
> >>> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> >>> index e45f87e..e993017 100644
> >>> --- a/recipes-containers/docker/docker_git.bb
> >>> +++ b/recipes-containers/docker/docker_git.bb
> >>> @@ -45,6 +45,7 @@ SRC_URI = "\
> >>>          file://docker.init \
> >>>          file://0001-libnetwork-use-GO-instead-of-go.patch \
> >>>          file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
> >>> +
>  file://0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch \
> >>>          "
> >>>
> >>>   require docker.inc
> >>> diff --git
> a/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> >>> new file mode 100644
> >>> index 0000000..67ddd49
> >>> --- /dev/null
> >>> +++
> b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> >>> @@ -0,0 +1,50 @@
> >>> +From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:00:00 2001
> >>> +From: Justin Cormack <justin.cormack@docker.com>
> >>> +Date: Thu, 25 Jul 2019 15:24:39 +0100
> >>> +Subject: [PATCH] Initialize nss libraries in Glibc so that the dynamic
> >>> + libraries are loaded in the host environment not in the chroot from
> untrusted
> >>> + files.
> >>> +
> >>> +See also OpenVZ
> https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
> >>> +
> >>> +Signed-off-by: Justin Cormack <justin.cormack@docker.com>
> >>> +(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
> >>> +Signed-off-by: Tibor Vass <tibor@docker.com>
> >>> +
> >>> +CVE: CVE-2019-14271
> >>> +Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0ccf4e4]
> >>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +---
> >>> + src/import/pkg/chrootarchive/archive.go | 9 +++++++++
> >>> + 1 file changed, 9 insertions(+)
> >>> +
> >>> +diff --git a/src/import/pkg/chrootarchive/archive.go
> b/src/import/pkg/chrootarchive/archive.go
> >>> +index 6ff61e6..83ed0c6 100644
> >>> +--- a/src/import/pkg/chrootarchive/archive.go
> >>> ++++ b/src/import/pkg/chrootarchive/archive.go
> >>> +@@ -4,13 +4,22 @@ import (
> >>> +       "fmt"
> >>> +       "io"
> >>> +       "io/ioutil"
> >>> ++      "net"
> >>> +       "os"
> >>> ++      "os/user"
> >>> +       "path/filepath"
> >>> +
> >>> +       "github.com/docker/docker/pkg/archive"
> >>> +       "github.com/docker/docker/pkg/idtools"
> >>> + )
> >>> +
> >>> ++func init() {
> >>> ++      // initialize nss libraries in Glibc so that the dynamic
> libraries are loaded in the host
> >>> ++      // environment not in the chroot from untrusted files.
> >>> ++      _, _ = user.Lookup("docker")
> >>> ++      _, _ = net.LookupHost("localhost")
> >>> ++}
> >>> ++
> >>> + // NewArchiver returns a new Archiver which uses chrootarchive.Untar
> >>> + func NewArchiver(idMapping *idtools.IdentityMapping)
> *archive.Archiver {
> >>> +       if idMapping == nil {
> >>> +--
> >>> +2.8.1
> >>> +
> >>> --
> >>> 2.8.1
> >>>
> >
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b4a229059375aa6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 3, 2019 at 10:03 PM Hongxu Jia &lt;<a h=
ref=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 9/4/19 2=
:28 AM, akuster808 wrote:<br>
&gt;<br>
&gt; On 9/3/19 10:40 AM, Bruce Ashfield wrote:<br>
&gt;&gt; On Tue, Sep 3, 2019 at 4:02 AM Hongxu Jia &lt;<a href=3D"mailto:ho=
ngxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt; =
wrote:<br>
&gt;&gt;&gt; Backport a patch from upstream to fix CVE-2019-14271<br>
&gt;&gt; Given the docker version bumps that Stefan posted earlier, is this=
<br>
&gt;&gt; still required ?<br>
In Stefan upgraded patch earlier, it switched from moby:master to <br>
engine:19.03,<br>
<br>
I found the upgraded version contains the patch<br>
<br>
commit fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b<br>
Author: Justin Cormack &lt;<a href=3D"mailto:justin.cormack@docker.com" tar=
get=3D"_blank">justin.cormack@docker.com</a>&gt;<br>
Date:=C2=A0=C2=A0 Thu Jul 25 15:24:39 2019 +0100<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Initialize nss libraries in Glibc so that the dyna=
mic libraries are <br>
loaded in the host<br>
=C2=A0=C2=A0=C2=A0=C2=A0 environment not in the chroot from untrusted files=
.<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 See also OpenVZ <br>
<a href=3D"https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11=
b3e05236b51fd7e9/src/enter.c#L227-L234" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b=
51fd7e9/src/enter.c#L227-L234</a><br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Justin Cormack &lt;<a href=3D"mailt=
o:justin.cormack@docker.com" target=3D"_blank">justin.cormack@docker.com</a=
>&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 (cherry picked from commit cea6dca993c2b4cfa99b1e7=
a19ca134c8ebc236b)<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Tibor Vass &lt;<a href=3D"mailto:ti=
bor@docker.com" target=3D"_blank">tibor@docker.com</a>&gt;<br>
<br>
$ git branch -r --contains fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b<br>
=C2=A0=C2=A0 origin/19.03<br>
<br>
If Stefan&#39;s patch is accepted, please ignore this one<br>
<br>
//Hongxu<br>
<br>
&gt; What about stable branches? can this be reused for any of them?<br>
<br>
I am afraid it exists on master branch only<br>
<br>
jia@pek-lpg-core1-vm2:/buildarea1/hjia/community/moby$ git branch -r <br>
--contains a316b10dab79d9298b02c7930958ed52e0ccf4e4<br>
=C2=A0=C2=A0 origin/HEAD -&gt; origin/master<br>
=C2=A0=C2=A0 origin/master<br>
<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">FYI: I just pushed changes to master that should address t=
his (and the other docker uprevs that were pending).</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; - armin<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@win=
driver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0recipes-containers/docker/<a href=3D"http://docker=
_git.bb" rel=3D"noreferrer" target=3D"_blank">docker_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0...nss-libraries-in-Glibc-so-that-the-dynami.patch=
 | 50 ++++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A02 files changed, 51 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 recipes-containers/docker/files=
/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/recipes-containers/docker/<a href=3D"http://docke=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">docker_git.bb</a> b/recipes-=
containers/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">docker_git.bb</a><br>
&gt;&gt;&gt; index e45f87e..e993017 100644<br>
&gt;&gt;&gt; --- a/recipes-containers/docker/<a href=3D"http://docker_git.b=
b" rel=3D"noreferrer" target=3D"_blank">docker_git.bb</a><br>
&gt;&gt;&gt; +++ b/recipes-containers/docker/<a href=3D"http://docker_git.b=
b" rel=3D"noreferrer" target=3D"_blank">docker_git.bb</a><br>
&gt;&gt;&gt; @@ -45,6 +45,7 @@ SRC_URI =3D &quot;\<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.init \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libnetwork-use-G=
O-instead-of-go.patch \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-imporve-hardcode=
d-CC-on-cross-compile.patch \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Initialize-nss-librari=
es-in-Glibc-so-that-the-dynami.patch \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0require docker.inc<br>
&gt;&gt;&gt; diff --git a/recipes-containers/docker/files/0001-Initialize-n=
ss-libraries-in-Glibc-so-that-the-dynami.patch b/recipes-containers/docker/=
files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..67ddd49<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/recipes-containers/docker/files/0001-Initialize-nss-libr=
aries-in-Glibc-so-that-the-dynami.patch<br>
&gt;&gt;&gt; @@ -0,0 +1,50 @@<br>
&gt;&gt;&gt; +From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:0=
0:00 2001<br>
&gt;&gt;&gt; +From: Justin Cormack &lt;<a href=3D"mailto:justin.cormack@doc=
ker.com" target=3D"_blank">justin.cormack@docker.com</a>&gt;<br>
&gt;&gt;&gt; +Date: Thu, 25 Jul 2019 15:24:39 +0100<br>
&gt;&gt;&gt; +Subject: [PATCH] Initialize nss libraries in Glibc so that th=
e dynamic<br>
&gt;&gt;&gt; + libraries are loaded in the host environment not in the chro=
ot from untrusted<br>
&gt;&gt;&gt; + files.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +See also OpenVZ <a href=3D"https://github.com/kolyshkin/vzctl=
/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/kolyshkin/vzctl/blob/a=
3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234</a><br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +Signed-off-by: Justin Cormack &lt;<a href=3D"mailto:justin.co=
rmack@docker.com" target=3D"_blank">justin.cormack@docker.com</a>&gt;<br>
&gt;&gt;&gt; +(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8e=
bc236b)<br>
&gt;&gt;&gt; +Signed-off-by: Tibor Vass &lt;<a href=3D"mailto:tibor@docker.=
com" target=3D"_blank">tibor@docker.com</a>&gt;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +CVE: CVE-2019-14271<br>
&gt;&gt;&gt; +Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0=
ccf4e4]<br>
&gt;&gt;&gt; +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@wi=
ndriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt;&gt; +---<br>
&gt;&gt;&gt; + src/import/pkg/chrootarchive/archive.go | 9 +++++++++<br>
&gt;&gt;&gt; + 1 file changed, 9 insertions(+)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +diff --git a/src/import/pkg/chrootarchive/archive.go b/src/im=
port/pkg/chrootarchive/archive.go<br>
&gt;&gt;&gt; +index 6ff61e6..83ed0c6 100644<br>
&gt;&gt;&gt; +--- a/src/import/pkg/chrootarchive/archive.go<br>
&gt;&gt;&gt; ++++ b/src/import/pkg/chrootarchive/archive.go<br>
&gt;&gt;&gt; +@@ -4,13 +4,22 @@ import (<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io/ioutil&quot;<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;net&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;os/user&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;path/filepath&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com=
/docker/docker/pkg/archive" rel=3D"noreferrer" target=3D"_blank">github.com=
/docker/docker/pkg/archive</a>&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com=
/docker/docker/pkg/idtools" rel=3D"noreferrer" target=3D"_blank">github.com=
/docker/docker/pkg/idtools</a>&quot;<br>
&gt;&gt;&gt; + )<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; ++func init() {<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // initialize nss libraries in Glibc so=
 that the dynamic libraries are loaded in the host<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // environment not in the chroot from u=
ntrusted files.<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _, _ =3D user.Lookup(&quot;docker&quot;=
)<br>
&gt;&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _, _ =3D net.LookupHost(&quot;localhost=
&quot;)<br>
&gt;&gt;&gt; ++}<br>
&gt;&gt;&gt; ++<br>
&gt;&gt;&gt; + // NewArchiver returns a new Archiver which uses chrootarchi=
ve.Untar<br>
&gt;&gt;&gt; + func NewArchiver(idMapping *idtools.IdentityMapping) *archiv=
e.Archiver {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if idMapping =3D=3D nil {<br>
&gt;&gt;&gt; +--<br>
&gt;&gt;&gt; +2.8.1<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.8.1<br>
&gt;&gt;&gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000b4a229059375aa6f--
