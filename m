Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B617E00D7F; Wed, 12 Oct 2016 16:11:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.170 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.170 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E8D0E00D33
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Oct 2016 16:11:37 -0700 (PDT)
Received: by mail-qt0-f170.google.com with SMTP id q7so28498500qtq.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Oct 2016 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4HvWnKZ1xLqZXt9o2EC/vAGjjZj4L+wE2GGJPjKu8/s=;
	b=fU0rZ4HC5YFOYVDVbsK6kLtmdqEh9LAAUGKljsu0NVyE8yhnVxTGWL9VMXJ/ACKLm8
	tZKgF8HxCwfoGEMjV/U8rZig+ZoivOelRVO6MDCX92qUx3tCkh0OIiWCZ9OQPGOGMHWm
	pwVrNFO68C9SDSSsHhJkxw0Pc2D0mvSJ9/ckfBm7AWaWEX/d0YnAUPkhUl6lZA0Rs7KZ
	K7fdUkbvcJz34FGxTkSmniqsvFnbYODmDFjDXyS2y7fPH1wbYYuqovV1heE8wt6N33Ee
	pkvVd09UTIGcEgg5E2OWN3gmKmJfASb++DCDotntHv0lncZE36HEG5HOgXqdGFlbYDJi
	cung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4HvWnKZ1xLqZXt9o2EC/vAGjjZj4L+wE2GGJPjKu8/s=;
	b=Xvw/+r9sOyH7e9cncx5ZZac4NytEN7XTlePnkqv+bHqVr7Lo6IBqGzqnZRl6aQmkdw
	XWOBJhQPC/I8QyWZgfIrz+FELxVogIWT+9s1PLpDAq/Yq87/mj05YD14n/sLLaNDzhWQ
	3caqVDkFYHVKC8vOzQa8J9jgWhJ3t9VdBcDuM8ELrYI5lhy3ruq9UtsQUt7UE5ieVNdu
	jTJLHV9hYyl2MEQxrqLzs3spv1/vpw04Kh9DlV6nDtg9wDXE4wQvlUgvaQGIgDXN+5Sg
	i1yRrRNRTK3W1E7N7qjmk8/4qDreU2DbJVLDlYonu91JcXRVB3HW06wV+B7FjqXg8bs5
	YQgw==
X-Gm-Message-State: AA6/9RkGj4ykKmZe2l0eytO8EwlrfjQHFSh6Tp3QNDhlUf8iHBzyl9Bfxj0hptWlcJngTDJODdAlaOrWjhNfPA==
X-Received: by 10.200.51.20 with SMTP id t20mr3868303qta.48.1476313896410;
	Wed, 12 Oct 2016 16:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Wed, 12 Oct 2016 16:11:35 -0700 (PDT)
In-Reply-To: <1475786077-10185-1-git-send-email-jason.wessel@windriver.com>
References: <1475786077-10185-1-git-send-email-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Oct 2016 19:11:35 -0400
Message-ID: <CADkTA4Pj5gUW2LR5ZQ6AB5N+rEH0huZqp2P6j_FkxM7w3+5Gbg@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [v2 PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Wed, 12 Oct 2016 23:11:39 -0000
Content-Type: multipart/alternative; boundary=001a1137c3e25f65f1053eb31de3

--001a1137c3e25f65f1053eb31de3
Content-Type: text/plain; charset=UTF-8

merged

Bruce

On Thu, Oct 6, 2016 at 4:34 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The go-cross package is explicitly for compiling target libraries on
> the host system.  When the target architecture matches the host
> architecture it will actually use the host's linker and compiler
> however which can result in the generation of the cgo.a library having
> linker symbols which might not work properly when compiling other
> packages.
>
> A typical error looks like this when building consul-migrate:
>
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/
> x86_64-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc
> failed: exit status 1
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/
> libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld:
> /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-
> migrate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized
> relocation (0x2a) in section `.text'
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/
> libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link
> failed: Bad value
> collect2: error: ld returned 1 exit status
>
> The fix is to use the make.bash --target-only option to properly build
> the libraries with the target toolchain.  The "go" binaries are thrown
> away but the cross compilation libraries are preserved.  The sysroot
> strip also has to be disabled because it will run the host strip on
> the target binaries.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go-cross/go-cross.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc
> b/recipes-devtools/go-cross/go-cross.inc
> index 613e9c7..181f4aa 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -2,6 +2,10 @@ inherit cross
>
>  DEPENDS += "go-native"
>
> +# Prevent runstrip from running because you get errors when the host arch
> != target arch
> +#INHIBIT_PACKAGE_STRIP = "1"
> +STRIP = "echo"
> +
>  export GOHOSTOS = "${BUILD_GOOS}"
>  export GOHOSTARCH = "${BUILD_GOARCH}"
>  export GOOS = "${TARGET_GOOS}"
> @@ -26,6 +30,11 @@ do_compile() {
>
>      cd src
>      ./make.bash --host-only
> +    # Ensure cgo.a is built with the target toolchain
> +    export GOBIN="${B}/target/bin"
> +    rm -rf ${GOBIN}
> +    mkdir -p ${GOBIN}
> +    GO_FLAGS="-a" ./make.bash
>  }
>
>  do_install() {
> --
> 1.9.1
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

--001a1137c3e25f65f1053eb31de3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 6, 2016 at 4:34 PM, =
Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriver=
.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">The go-cross package is explicitly for comp=
iling target libraries on<br>
the host system.=C2=A0 When the target architecture matches the host<br>
architecture it will actually use the host&#39;s linker and compiler<br>
however which can result in the generation of the cgo.a library having<br>
linker symbols which might not work properly when compiling other<br>
packages.<br>
<br>
A typical error looks like this when building consul-migrate:<br>
<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/lib/<wbr>x86_64-lin=
ux/go/pkg/tool/<wbr>linux_amd64/link: running x86_64-yocto-linux-gcc failed=
: exit status 1<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/<wbr>libexec/x86_64=
-yocto-linux/<wbr>gcc/x86_64-yocto-linux/5.2.0/<wbr>ld: /opt/build-intel-x8=
6/tmp/work/<wbr>core2-64-yocto-linux/consul-<wbr>migrate/git-r0/build-tmp/g=
o-<wbr>link-956548052/000002.o: unrecognized relocation (0x2a) in section `=
.text&#39;<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/<wbr>libexec/x86_64=
-yocto-linux/<wbr>gcc/x86_64-yocto-linux/5.2.0/<wbr>ld: final link failed: =
Bad value<br>
collect2: error: ld returned 1 exit status<br>
<br>
The fix is to use the make.bash --target-only option to properly build<br>
the libraries with the target toolchain.=C2=A0 The &quot;go&quot; binaries =
are thrown<br>
away but the cross compilation libraries are preserved.=C2=A0 The sysroot<b=
r>
strip also has to be disabled because it will run the host strip on<br>
the target binaries.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go-cross/go-<wbr>cross.inc | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/recipes-devtools/go-cross/<wbr>go-cross.inc b/recipes-devtools=
/go-cross/<wbr>go-cross.inc<br>
index 613e9c7..181f4aa 100644<br>
--- a/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
+++ b/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
@@ -2,6 +2,10 @@ inherit cross<br>
<br>
=C2=A0DEPENDS +=3D &quot;go-native&quot;<br>
<br>
+# Prevent runstrip from running because you get errors when the host arch =
!=3D target arch<br>
+#INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
+STRIP =3D &quot;echo&quot;<br>
+<br>
=C2=A0export GOHOSTOS =3D &quot;${BUILD_GOOS}&quot;<br>
=C2=A0export GOHOSTARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
=C2=A0export GOOS =3D &quot;${TARGET_GOOS}&quot;<br>
@@ -26,6 +30,11 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0cd src<br>
=C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 # Ensure cgo.a is built with the target toolchain<br>
+=C2=A0 =C2=A0 export GOBIN=3D&quot;${B}/target/bin&quot;<br>
+=C2=A0 =C2=A0 rm -rf ${GOBIN}<br>
+=C2=A0 =C2=A0 mkdir -p ${GOBIN}<br>
+=C2=A0 =C2=A0 GO_FLAGS=3D&quot;-a&quot; ./make.bash<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a1137c3e25f65f1053eb31de3--
