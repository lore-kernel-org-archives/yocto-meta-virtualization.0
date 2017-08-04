Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07A4EE00C5C; Thu,  3 Aug 2017 20:52:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.66 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08B47E00C55
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Aug 2017 20:52:35 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id 65so336877lfa.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Aug 2017 20:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=63WuHJQsq2EF75lUSJvjkgv8MxlU+3QcWh9v/eG6Gbk=;
	b=Tzr0EQmTwbf/Sohl4SzTxn9tROxKOXMUuGdHnG6X/DsKs+SZcC6pY9a19s4PMj9KWO
	5/1pe9sMup7cO/qrIRP9lt0wPJN5KseeK86mj49DRivTF8DfnEJ4+F34gWvygVKsROSd
	u9kJsZCbtcWWUp1CZtFdt70iOdg7UF2w/mMBXOtF7Ub712tX/Bx3Jf/horE/MtYJuYNi
	FvekvONXOBLw6S/aGybDH+7VSKL9RCHRtiq1+49Sv54FcsriTG1c6HmpNO/u1qaq5wZT
	GtwHtR+9j8cE0CXx1q92rcFvpH/VDI1LGkFOGPv06fASBI2CMhmZun7b1qlVFxV8wJmG
	TZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=63WuHJQsq2EF75lUSJvjkgv8MxlU+3QcWh9v/eG6Gbk=;
	b=WFVZyOAbp2bumVvlHC7htYqN4iEo3yfkxKihv5LIvuJ7Jzp1dBThpMjLANKPVTZjr6
	v/WbyvKJ+9IQJ+UzopWn0iasw04CfKzewmN3c8aOra7jZkHaceINNrVWyPvZbmWjnJ/i
	LAbMQyzlhjcor4iYeXjjXMdHUfbwjhCn4RdUGG9KW0LpoxNwIl7POKNwOgnrvKtjOPTH
	ewOPHj11bXgDFeM7AOSGxLVwD1n9rzauZRf7nzFyxJttrOjpQUZkKesgIBz2jo97oji6
	Q5VUo8puAtHBbDlIA7udIwL1YVAqBwUO2SxxwuN/z0gGQlklGg5fxGLX6PG9fO1OJtGT
	KaKw==
X-Gm-Message-State: AHYfb5iSqFfSp2bVaOIcXXR03I3ENQo4brC4DB++I2fF2YHfz4srI10X
	FHxrf7pxDCwqPg7AYhL8j1nAPxiA4A==
X-Received: by 10.25.145.71 with SMTP id y7mr320429lfj.17.1501818754236; Thu,
	03 Aug 2017 20:52:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.18 with HTTP; Thu, 3 Aug 2017 20:52:33 -0700 (PDT)
In-Reply-To: <20170804030100.10658-1-Qi.Chen@windriver.com>
References: <20170804030100.10658-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Aug 2017 23:52:33 -0400
Message-ID: <CADkTA4PQZZadfRb3sB2P3xT1X9nHVh9Bq6yvhFHJkuBHLVk4Cg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: fix dpdk PACKAGECONFIG
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
X-List-Received-Date: Fri, 04 Aug 2017 03:52:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c1cd06a5d07e50555e56da5"

--94eb2c1cd06a5d07e50555e56da5
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Aug 3, 2017 at 11:01 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add dpdk as a runtime dependency when 'dpdk' PACKAGECONFIG is enabled.
>
> Also, introduce a variable DPDK_INSTALL_DIR, and default it to /opt/dpdk.
> This is because users might install DPDK into different locations,
> e.g. /usr. And it would easy for users to override this variable
> to make openvswitch build with dpdk correctly.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index a3c586b..35f4ba8 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -48,8 +48,10 @@ SRC_URI += " \
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
>
> +DPDK_INSTALL_DIR ?= "/opt/dpdk"
> +
>  PACKAGECONFIG ?= ""
> -PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_
> TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
> +PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_
> TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-
> linuxapp-gcc,,dpdk,dpdk"
>
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.
> --
> 2.11.0
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

--94eb2c1cd06a5d07e50555e56da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 3, 2017 at 11:01 PM=
, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Add dpdk as a runtime dependency when &#39;dpdk&#39; PAC=
KAGECONFIG is enabled.<br>
<br>
Also, introduce a variable DPDK_INSTALL_DIR, and default it to /opt/dpdk.<b=
r>
This is because users might install DPDK into different locations,<br>
e.g. /usr. And it would easy for users to override this variable<br>
to make openvswitch build with dpdk correctly.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 4 +++-<b=
r>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index a3c586b..35f4ba8 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -48,8 +48,10 @@ SRC_URI +=3D &quot; \<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
<br>
+DPDK_INSTALL_DIR ?=3D &quot;/opt/dpdk&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
-PACKAGECONFIG[dpdk] =3D &quot;--with-dpdk=3D${STAGING_DIR_<wbr>TARGET}/opt=
/dpdk/${TARGET_<wbr>ARCH}-native-linuxapp-gcc,,<wbr>dpdk,&quot;<br>
+PACKAGECONFIG[dpdk] =3D &quot;--with-dpdk=3D${STAGING_DIR_<wbr>TARGET}${DP=
DK_INSTALL_DIR}/<wbr>share/${TARGET_ARCH}-native-<wbr>linuxapp-gcc,,dpdk,dp=
dk&quot;<br>
<br>
=C2=A0# Don&#39;t compile kernel modules by default since it heavily depend=
s on<br>
=C2=A0# kernel version. Use the in-kernel module for now.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--94eb2c1cd06a5d07e50555e56da5--
