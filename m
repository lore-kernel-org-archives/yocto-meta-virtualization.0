Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29A77E00CF0; Wed, 25 May 2016 06:41:23 -0700 (PDT)
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
	*      [209.85.218.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9561AE00CBA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 06:41:20 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id x130so11527409oia.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=U9550bxgj3Lp0RBOtX1Pc9DRmSgFBvDjRFXSkJUTiRs=;
	b=uoTJ8bbnSCnD/5PUKCtHI/u/de0Z4NUtA0EfPfIVblOI9weRAIgtPbNt88hER+Krka
	ECi8w3HxEdgfG5ceh+PnSIJ44TAHMSvmfffLUTUtmMSLdZi73bljLtrYhxb0BT6+hVyu
	OIKHkuVs8OUfCjT2V43QI7Ef44IxGVmUHlFcQnConDluxtgub4AKV1E2DVCwdmVrLPnc
	txTDP/S3W+m6JA7eaHtjT3ic+eYdu//aYb8XQnQzmiBkM3OCP2xY5U1QVsezn0mnNe2F
	o+U6CVKKPJ2PIZ4LYGO+0Ec4TAixTVDKY15cbO1bPmy+/aq2Zyw/uGuTvdQwWfpvJ9Bn
	RkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=U9550bxgj3Lp0RBOtX1Pc9DRmSgFBvDjRFXSkJUTiRs=;
	b=B+rekTHvdz1kfzEg1dWmNSyDnoI8RaOk3nvWGD3jihVzHu8lbPHWtc70w92KkMA6OM
	q0/NP52Ykn21bHOhV57TEvPZP+LduecFvlCKL8/Vz/a88sCBHIwJYzLInO8J0bfrx+6o
	KPrk6SmrAGi4S2CPkDvmaWyOHBRoQEEDQDZzQgMnTa9e22I0rrssEtTuUXS9hK9lx01M
	JneDUY8Lh7Yr/JJAYujMLpX/y2XrNICydRmrode3aGcRYruq5GHxYPbY5ZNj2grTd42a
	5N+t5Vbp/5RSAKABD1AdPZwUji9KnbNll2iSTuPO7oDn+l7QxS0y2o4ISBSORn7aRYKW
	6I+g==
X-Gm-Message-State: ALyK8tJnGuUEOCy3MGC7givwff1c75hnXfUmr+HbYUX//eOzFlywsTiJEJ1cr0t4yqOSgWvG4IU+WJySvdGzRQ==
MIME-Version: 1.0
X-Received: by 10.202.49.18 with SMTP id x18mr2015113oix.106.1464183679534;
	Wed, 25 May 2016 06:41:19 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Wed, 25 May 2016 06:41:19 -0700 (PDT)
In-Reply-To: <1464067680-18093-1-git-send-email-rongqing.li@windriver.com>
References: <1464067680-18093-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 25 May 2016 09:41:19 -0400
Message-ID: <CADkTA4PiFb3PZppP5+SH5kvW=ZapQB5=bQA8EjL6pGoD19tjMw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt-python: backport a patch to fix crash in getAllDomainStats
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
X-List-Received-Date: Wed, 25 May 2016 13:41:23 -0000
Content-Type: multipart/alternative; boundary=001a113cda421acfc50533aad470

--001a113cda421acfc50533aad470
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 1:28 AM, <rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>
>
We should have a better commit log here .. so I copied the one from your
patch into
the main log.

I also tend to prefer uprev's versus backports .. but we can carry this for
now, until
I get around to bumping the version.

Bruce


> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc        |  1 +
>  .../0001-fix-crash-in-getAllDomainStats.patch      | 57
> ++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644
> recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index c1dafe9..405d5f7 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -17,6 +17,7 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/*
> ${libdir}/${PYTHON_DIR}/*"
>
>  SRC_URI += "
> http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python
> "
>  SRC_URI +=
> "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
> +SRC_URI +=
> "file://0001-fix-crash-in-getAllDomainStats.patch;patchdir=../libvirt-python-${PV}"
>
>  SRC_URI[libvirt_python.md5sum] = "ed018c714d7ddbe93221c796dff283ed"
>  SRC_URI[libvirt_python.sha256sum] =
> "6d35ae9e7801573393b9c92471f39e6700d479f10b641df81d041b469f160bf8"
> diff --git
> a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> new file mode 100644
> index 0000000..0583a94
> --- /dev/null
> +++
> b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> @@ -0,0 +1,57 @@
> +From e9c4e2abffef007a28112ebb40a9586b0128f10b Mon Sep 17 00:00:00 2001
> +From: Pavel Hrdina <phrdina@redhat.com>
> +Date: Mon, 18 Apr 2016 16:53:50 +0200
> +Subject: [PATCH] fix crash in getAllDomainStats
> +
> +Upstream-Status: Backport
> +
> +Commits 1d39dbaf and 827ed9b4 broke the libvirt-python API by removing
> +virDomainRef() and virDomainFree().  virDomainStatsRecordListFree() will
> +free that domain pointer and later when virDomain (python object) call
> +its destructor and tries to free that same pointer again.
> +
> +Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1326839
> +
> +Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
> +---
> + libvirt-override.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/libvirt-override.c b/libvirt-override.c
> +index 4640ed5..2de95ce 100644
> +--- a/libvirt-override.c
> ++++ b/libvirt-override.c
> +@@ -8381,6 +8381,7 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> +     PyObject *py_retval;
> +     PyObject *py_record;
> +     PyObject *py_record_stats = NULL;
> ++    virDomainPtr dom = NULL;
> +     size_t i;
> +
> +     if (!(py_retval = PyList_New(nrecords)))
> +@@ -8392,9 +8393,12 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> +
> +         VIR_PY_LIST_SET_GOTO(py_retval, i, py_record, error);
> +
> ++        dom = records[i]->dom;
> ++        virDomainRef(dom);
> +         VIR_PY_TUPLE_SET_GOTO(py_record, 0,
> +-                              libvirt_virDomainPtrWrap(records[i]->dom),
> ++                              libvirt_virDomainPtrWrap(dom),
> +                               error);
> ++        dom = NULL;
> +
> +         if (!(py_record_stats =
> getPyVirTypedParameter(records[i]->params,
> +
> records[i]->nparams)))
> +@@ -8406,6 +8410,8 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> +     return py_retval;
> +
> +  error:
> ++    if (dom)
> ++        virDomainFree(dom);
> +     Py_XDECREF(py_retval);
> +     return NULL;
> + }
> +--
> +2.8.1
> +
> --
> 2.8.1
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

--001a113cda421acfc50533aad470
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 24, 2016 at 1:28 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Roy Li &lt;<a =
href=3D"mailto:rongqing.li@windriver.com">rongqing.li@windriver.com</a>&gt;=
<br>
<br></blockquote><div><br></div><div>We should have a better commit log her=
e .. so I copied the one from your patch into</div><div>the main log.</div>=
<div><br></div><div>I also tend to prefer uprev&#39;s versus backports .. b=
ut we can carry this for now, until</div><div>I get around to bumping the v=
ersion.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rong=
qing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A0.../0001-fix-crash-in-getAllDomainStats.patch=C2=A0 =C2=A0 =C2=A0 | 5=
7 ++++++++++++++++++++++<br>
=C2=A02 files changed, 58 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/libvirt/0001-fix-crash-in=
-getAllDomainStats.patch<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index c1dafe9..405d5f7 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -17,6 +17,7 @@ FILES_${PN}-python =3D &quot;${bindir}/* ${libdir}/* ${li=
bdir}/${PYTHON_DIR}/*&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/libvi=
rt-python-${PV}.tar.gz;name=3Dlibvirt_python" rel=3D"noreferrer" target=3D"=
_blank">http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=
=3Dlibvirt_python</a>&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://libvirt_api_xml_path.patch;patchdir=3D../li=
bvirt-python-${PV}&quot;<br>
+SRC_URI +=3D &quot;file://0001-fix-crash-in-getAllDomainStats.patch;patchd=
ir=3D../libvirt-python-${PV}&quot;<br>
<br>
=C2=A0SRC_URI[libvirt_python.md5sum] =3D &quot;ed018c714d7ddbe93221c796dff2=
83ed&quot;<br>
=C2=A0SRC_URI[libvirt_python.sha256sum] =3D &quot;6d35ae9e7801573393b9c9247=
1f39e6700d479f10b641df81d041b469f160bf8&quot;<br>
diff --git a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomai=
nStats.patch b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDom=
ainStats.patch<br>
new file mode 100644<br>
index 0000000..0583a94<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.=
patch<br>
@@ -0,0 +1,57 @@<br>
+From e9c4e2abffef007a28112ebb40a9586b0128f10b Mon Sep 17 00:00:00 2001<br>
+From: Pavel Hrdina &lt;<a href=3D"mailto:phrdina@redhat.com">phrdina@redha=
t.com</a>&gt;<br>
+Date: Mon, 18 Apr 2016 16:53:50 +0200<br>
+Subject: [PATCH] fix crash in getAllDomainStats<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Commits 1d39dbaf and 827ed9b4 broke the libvirt-python API by removing<br>
+virDomainRef() and virDomainFree().=C2=A0 virDomainStatsRecordListFree() w=
ill<br>
+free that domain pointer and later when virDomain (python object) call<br>
+its destructor and tries to free that same pointer again.<br>
+<br>
+Resolves: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1326839=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug=
.cgi?id=3D1326839</a><br>
+<br>
+Signed-off-by: Pavel Hrdina &lt;<a href=3D"mailto:phrdina@redhat.com">phrd=
ina@redhat.com</a>&gt;<br>
+---<br>
+ libvirt-override.c | 8 +++++++-<br>
+ 1 file changed, 7 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/libvirt-override.c b/libvirt-override.c<br>
+index 4640ed5..2de95ce 100644<br>
+--- a/libvirt-override.c<br>
++++ b/libvirt-override.c<br>
+@@ -8381,6 +8381,7 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *re=
cords,<br>
+=C2=A0 =C2=A0 =C2=A0PyObject *py_retval;<br>
+=C2=A0 =C2=A0 =C2=A0PyObject *py_record;<br>
+=C2=A0 =C2=A0 =C2=A0PyObject *py_record_stats =3D NULL;<br>
++=C2=A0 =C2=A0 virDomainPtr dom =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0size_t i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0if (!(py_retval =3D PyList_New(nrecords)))<br>
+@@ -8392,9 +8393,12 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *r=
ecords,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_PY_LIST_SET_GOTO(py_retval, i, py_re=
cord, error);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dom =3D records[i]-&gt;dom;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainRef(dom);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_PY_TUPLE_SET_GOTO(py_record, 0,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libvirt_virDomainPtrWrap(records[i]-&gt;dom=
),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libvirt_virDomainPtrWrap(dom),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dom =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(py_record_stats =3D getPyVirTypedP=
arameter(records[i]-&gt;params,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 records[i]-&gt;nparams)))<=
br>
+@@ -8406,6 +8410,8 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *re=
cords,<br>
+=C2=A0 =C2=A0 =C2=A0return py_retval;<br>
+<br>
+=C2=A0 error:<br>
++=C2=A0 =C2=A0 if (dom)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainFree(dom);<br>
+=C2=A0 =C2=A0 =C2=A0Py_XDECREF(py_retval);<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ }<br>
+--<br>
+2.8.1<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113cda421acfc50533aad470--
