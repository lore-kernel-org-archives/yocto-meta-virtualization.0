Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFAAAE00DC1; Sun,  5 Jun 2016 23:46:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50647E00DA2
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 Jun 2016 23:46:14 -0700 (PDT)
Received: by mail-oi0-f49.google.com with SMTP id p204so16474424oih.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 05 Jun 2016 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ODcVL29ftERWPdeS1x636vPElswKs1WA29uDoPwiJJQ=;
	b=lDQFcaUycBNrNRUo1E5aiUv37NKXAjUkdyYVHEgBzpJVEaH3nIF/u4BATnqW7ZcAvs
	k6aJms2icW5C78zqp/rGxw1QhTpbHaSkwgHgkxYsxAt9Rv4t3wkx2hmznnHtPJTF8ooi
	ucYSnRnf1MU0x38kgpnAyK8iIawOhnfHrG0PLOi3vbsfO+uSjpCDxl+NBrwz3LKwxNeA
	IeVwYHEeG3xtxH6CjEfxzNLjeCY82rSAoBT+9YjPsfHAb6OCpY03gpRhUKQCZDhkWiKV
	BTminTbImtG7KqJOWxIkVOIyyKfp4Ruvf3p5fLmsOBl1pY6eYPXeNZaNnOtTNoJ2ChJ+
	7xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ODcVL29ftERWPdeS1x636vPElswKs1WA29uDoPwiJJQ=;
	b=d4E9SodGsw+TpKkMfNJTAvacHSHVapbmFnWryvkV73+IXsWrF44iVTvf7egQqJkQxx
	AAmV65PXP9Fs+MRvQdWYma09a8YiJVjPaHqKVMc+e21glEgsMssBTpPnvPZArCNNiKdP
	sYkCILROscGnmh9rzYwuE82G3kXDk9fNFTxqF8bnSy0pOjNegqF/dZoMk2bBz/Jl242n
	yfrrn24zEQCicpq2mXZ2T+spXG85O5qucBlMDZGLsepV7T98fXAK+EQUs0a+rwXKWUrh
	ucRT0ExzzN+PlIaVvZaWLD1fzSRHUxLa3kzan7CEdgrygwb/HnzvJyBvRu/ldn98X4u3
	LseA==
X-Gm-Message-State: ALyK8tJ/wsHRjoS3pak8uqcdhOIqeNyWCUc93wkTO5Oi/vovzssYvp9TygI8kjruTeGys2E46ErYcW6TdsLS9Q==
X-Received: by 10.202.77.129 with SMTP id a123mr6340678oib.143.1465195573990; 
	Sun, 05 Jun 2016 23:46:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Sun, 5 Jun 2016 23:46:13 -0700 (PDT)
In-Reply-To: <5754E2FF.4050308@windriver.com>
References: <20160601083543.23700-1-kai.kang@windriver.com>
	<5754E2FF.4050308@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Jun 2016 02:46:13 -0400
Message-ID: <CADkTA4NwHRu-fHYh-mDLsHXuAXAS3LrPyO20NZP-kT3hX8GiAQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH] criu: fix build-deps qa warning
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
X-List-Received-Date: Mon, 06 Jun 2016 06:46:16 -0000
Content-Type: multipart/alternative; boundary=001a113de8deb6db8a0534966da4

--001a113de8deb6db8a0534966da4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 5, 2016 at 10:42 PM, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2016=E5=B9=B406=E6=9C=8801=E6=97=A5 16:35, kai.kang@windriver.com wrot=
e:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It shows warning when build crius if libselinux has been built already:
>>
>>    WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build
>> dependency? [build-deps]
>>
>> Add a patch to disable selinux support when 'selinux' is not in
>> PACKAGECONF.
>>
>> And update indentation at same time.
>>
>
> Hi Bruce,
>
> Any comment on this commit, please?
>


I just hadn't gotten to it yet.

This looks fine to me, and is now merged to master.

Bruce


>
>
> Regards,
> Kai
>
>
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   recipes-containers/criu/criu_git.bb                | 12 ++++++----
>>   .../criu/files/disable-selinux.patch               | 26
>> ++++++++++++++++++++++
>>   2 files changed, 34 insertions(+), 4 deletions(-)
>>   create mode 100644 recipes-containers/criu/files/disable-selinux.patch
>>
>> diff --git a/recipes-containers/criu/criu_git.bb
>> b/recipes-containers/criu/criu_git.bb
>> index 816c806..c8be78f 100644
>> --- a/recipes-containers/criu/criu_git.bb
>> +++ b/recipes-containers/criu/criu_git.bb
>> @@ -18,10 +18,11 @@ PR =3D "r0"
>>   PV =3D "1.6+git${SRCPV}"
>>     SRC_URI =3D "git://github.com/xemul/criu.git;protocol=3Dgit \
>> -          file://0001-criu-Fix-toolchain-hardcode.patch \
>> -          file://0002-criu-Skip-documentation-install.patch \
>> -       file://0001-criu-Change-libraries-install-directory.patch \
>> -         "
>> +           file://0001-criu-Fix-toolchain-hardcode.patch \
>> +           file://0002-criu-Skip-documentation-install.patch \
>> +           file://0001-criu-Change-libraries-install-directory.patch \
>> +           ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '',
>> 'file://disable-selinux.patch', d)} \
>> +          "
>>     COMPATIBLE_HOST =3D "(x86_64|arm|aarch64).*-linux"
>>   @@ -51,6 +52,9 @@ export HOST_SYS
>>     inherit setuptools
>>   +PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG[selinux] =3D ",,libselinux"
>> +
>>   do_compile_prepend() {
>>       rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
>>       ln -s
>> ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto
>> ${S}/protobuf/google/protobuf/descriptor.proto
>> diff --git a/recipes-containers/criu/files/disable-selinux.patch
>> b/recipes-containers/criu/files/disable-selinux.patch
>> new file mode 100644
>> index 0000000..da881dd
>> --- /dev/null
>> +++ b/recipes-containers/criu/files/disable-selinux.patch
>> @@ -0,0 +1,26 @@
>> +Upstream-Status: Inappropriate [disable feature]
>> +
>> +It shows warning when build crius if libselinux has been built already:
>> +
>> +  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build
>> dependency? [build-deps]
>> +
>> +Apply this patch to disable selinux support when 'selinux' is not in
>> PACKAGECONF.
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +diff --git a/Makefile.config b/Makefile.config
>> +index ce4b8d8..3ac2780 100644
>> +--- a/Makefile.config
>> ++++ b/Makefile.config
>> +@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)
>> +       DEFINES +=3D -DCONFIG_HAS_LIBBSD
>> + endif
>> +
>> +-ifeq ($(call pkg-config-check,libselinux),y)
>> +-      LIBS :=3D -lselinux $(LIBS)
>> +-      DEFINES +=3D -DCONFIG_HAS_SELINUX
>> +-endif
>> +-
>> + $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak
>> include/config-base.h
>> +       $(E) "  GEN     " $@
>> +       $(Q) @echo '#ifndef __CR_CONFIG_H__' > $@
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113de8deb6db8a0534966da4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Jun 5, 2016 at 10:42 PM, Kang Kai <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n 2016=E5=B9=B406=E6=9C=8801=E6=97=A5 16:35, <a href=3D"mailto:kai.kang@win=
driver.com" target=3D"_blank">kai.kang@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_bla=
nk">kai.kang@windriver.com</a>&gt;<br>
<br>
It shows warning when build crius if libselinux has been built already:<br>
<br>
=C2=A0 =C2=A0WARNING: QA Issue: criu rdepends on libselinux, but it isn&#39=
;t a build dependency? [build-deps]<br>
<br>
Add a patch to disable selinux support when &#39;selinux&#39; is not in PAC=
KAGECONF.<br>
<br>
And update indentation at same time.<br>
</blockquote>
<br></span>
Hi Bruce,<br>
<br>
Any comment on this commit, please?<br></blockquote><div><br><br></div><div=
>I just hadn&#39;t gotten to it yet.<br><br></div><div>This looks fine to m=
e, and is now merged to master.<br><br></div><div>Bruce<br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
Regards,<br>
Kai<div><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0 recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">criu_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 ++++++----<br>
=C2=A0 .../criu/files/disable-selinux.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 26 ++++++++++++++++++++++<br>
=C2=A0 2 files changed, 34 insertions(+), 4 deletions(-)<br>
=C2=A0 create mode 100644 recipes-containers/criu/files/disable-selinux.pat=
ch<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu_git.bb</a> b/recipes-containers/criu/<a =
href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu_git.b=
b</a><br>
index 816c806..c8be78f 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
@@ -18,10 +18,11 @@ PR =3D &quot;r0&quot;<br>
=C2=A0 PV =3D &quot;1.6+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemul/cr=
iu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/xemu=
l/criu.git;protocol=3Dgit</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Fix-toolchain-hardcode=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-criu-Skip-documentation-ins=
tall.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Change-libraries-install-direc=
tory.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Fix-toolchain-ha=
rdcode.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-criu-Skip-documentati=
on-install.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Change-libraries=
-install-directory.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;selinux&#39;, &#39;&#39;, &#39;file://disable-selinux.pat=
ch&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0 =C2=A0 COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<=
br>
=C2=A0 @@ -51,6 +52,9 @@ export HOST_SYS<br>
=C2=A0 =C2=A0 inherit setuptools<br>
=C2=A0 +PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[selinux] =3D &quot;,,libselinux&quot;<br>
+<br>
=C2=A0 do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 rm -rf ${S}/protobuf/google/protobuf/descriptor.proto<=
br>
=C2=A0 =C2=A0 =C2=A0 ln -s=C2=A0 ${PKG_CONFIG_SYSROOT_DIR}/usr/include/goog=
le/protobuf/descriptor.proto ${S}/protobuf/google/protobuf/descriptor.proto=
<br>
diff --git a/recipes-containers/criu/files/disable-selinux.patch b/recipes-=
containers/criu/files/disable-selinux.patch<br>
new file mode 100644<br>
index 0000000..da881dd<br>
--- /dev/null<br>
+++ b/recipes-containers/criu/files/disable-selinux.patch<br>
@@ -0,0 +1,26 @@<br>
+Upstream-Status: Inappropriate [disable feature]<br>
+<br>
+It shows warning when build crius if libselinux has been built already:<br=
>
+<br>
+=C2=A0 WARNING: QA Issue: criu rdepends on libselinux, but it isn&#39;t a =
build dependency? [build-deps]<br>
+<br>
+Apply this patch to disable selinux support when &#39;selinux&#39; is not =
in PACKAGECONF.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+diff --git a/Makefile.config b/Makefile.config<br>
+index ce4b8d8..3ac2780 100644<br>
+--- a/Makefile.config<br>
++++ b/Makefile.config<br>
+@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DCONFIG_HAS_LIBBSD<br>
+ endif<br>
+<br>
+-ifeq ($(call pkg-config-check,libselinux),y)<br>
+-=C2=A0 =C2=A0 =C2=A0 LIBS :=3D -lselinux $(LIBS)<br>
+-=C2=A0 =C2=A0 =C2=A0 DEFINES +=3D -DCONFIG_HAS_SELINUX<br>
+-endif<br>
+-<br>
+ $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak include/config=
-base.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(E) &quot;=C2=A0 GEN=C2=A0 =C2=A0 =C2=A0&quot;=
 $@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) @echo &#39;#ifndef __CR_CONFIG_H__&#39; &g=
t; $@<br>
</blockquote>
<br>
<br>
-- <br></div></div>
Regards,<br>
Neil | Kai Kang<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113de8deb6db8a0534966da4--
