Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1388E00A6A; Tue,  1 May 2018 20:18:53 -0700 (PDT)
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
	*      [209.85.215.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FA22E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 20:18:49 -0700 (PDT)
Received: by mail-lf0-f50.google.com with SMTP id w8-v6so18749193lfe.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=88mVdErk9JBY1fFiWDELuUDqUR+rHED/efaS7qAr5vg=;
	b=f9EncJFeFDFICijCyjfTfx5w0D9FOYeII3MI1pMmBPKxk69krHC3VltXN1mhA1M7f9
	SsTYUX9vRPE1nGjb3GzaHblnc6DsFIPRxk2h41sWHZmAp7jlgGjW+gMC7yYUGWTm01bO
	mkakCC3fAmEW26/Z8MqOQUN742QInlRCdsnmf81NA2VnfNTfHBKfLgHxzPdaorTFGfo/
	zYBGZOfFRe0E4BaliPG4jNapKh6Tc3yeWgMuTBSnVaJm8QRfLMMKNGmerR7dAFsDVSLb
	A1pfLzkBe8u1z/0TSjzwiZhegbJCnjhALWbOxLKcpr6VPKQRWwm83dPbMLlcpkANbPGz
	Nkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=88mVdErk9JBY1fFiWDELuUDqUR+rHED/efaS7qAr5vg=;
	b=NkQRNo37qPGqsrNwaRV3/dw5IYT9QH3JUS6bcH2xxL99cNP55HOR47Uig55Kh6Za/z
	Y4jzt62SOrqgoufUT6TV/FMTAn64+dXjtWb39oUZIREwgj2BLTFfM4sm7f6X9IkWzIsl
	y6/uP0SiF4yOATw/mrFwhQ44mJyLywGJOZm9/+UtnGfO12ozz9zJzblumYYP3b0Xrzoj
	MsQP81J5xiiYsCHF/MT0o1bbnSkXfp3q1dot1QVDbEjcMRPOkumBgb2LrwFZsrnCOA8M
	MbwBq/aDSGJhDJp7BpdNIcnfiXkCKPdTquIir4YZsSY9q7H9Xw+8/FOWchLKtTs62GJ8
	uaCg==
X-Gm-Message-State: ALQs6tCVa4AbDLi9v9RsaifIIKRGaRdGJlYVKz1G+woc2eyzd7Ip+hz6
	6zEOzn6YLTJuxm2HPN1MfetzJQdicyIQMXe0F4qtRQ==
X-Google-Smtp-Source: AB8JxZrsJYA/cou4vdTubLcqwy0lfKsUJVf/USVtWHJH+hf206kE/tRU+bdms/RANN9WySjBPR1IsbUQGO9Pe1td8yc=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr11663949ljh.142.1525231128186; 
	Tue, 01 May 2018 20:18:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Tue, 1 May 2018 20:18:47 -0700 (PDT)
In-Reply-To: <20180427164443.8590-1-kurt.bodiker@braintrust-us.com>
References: <20180427164443.8590-1-kurt.bodiker@braintrust-us.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 May 2018 23:18:47 -0400
Message-ID: <CADkTA4OtS1rR9pcX5EHM5He_b0-zi3fZJw6AQp1hjY5R6ro_oQ@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/1] xen: TPM Emulator: Corrected license from GPL to GPLv2
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
X-List-Received-Date: Wed, 02 May 2018 03:18:54 -0000
Content-Type: multipart/alternative; boundary="00000000000098955c056b308b24"

--00000000000098955c056b308b24
Content-Type: text/plain; charset="UTF-8"

After merging your v5 series, this doesn't look to be needed. Let me know
if it does still need to be applied.

Bruce

On Fri, Apr 27, 2018 at 12:44 PM, Kurt Bodiker <
kurt.bodiker@braintrust-us.com> wrote:

> TPM Emulator is licensed under GPLv2.  Bitbake does not consider GPL a
> valid license, so it throws a warning.  Fix that.
>
> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> ---
> This patch is to be applied after applying the Xen vTPM patch series. It
> corrects the license applicable to the TPM Emulator which I had
> incorrectly listed in the recipe as GPL to the correct license type of
> GPLv2.
>
>  recipes-extended/xen/tpm-emulator_0.7.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/tpm-emulator_0.7.4.bb
> b/recipes-extended/xen/tpm-emulator_0.7.4.bb
> index 7207676..f626929 100644
> --- a/recipes-extended/xen/tpm-emulator_0.7.4.bb
> +++ b/recipes-extended/xen/tpm-emulator_0.7.4.bb
> @@ -3,7 +3,7 @@
>
>  DESCRIPTION = "TPM Emulator"
>  HOMEPAGE = "http://xenbits.xen.org/xen-extfiles"
> -LICENSE = "GPL"
> +LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://README;md5=eeabd77cf8fd8a8bc42983884cb09863"
>
>  SRC_URI = "\
> --
> 2.14.2
>
>
> --
>
> *This email and all attachments are considered confidential and the
> proprietary information of BrainTrust Holdings.  Unauthorized disclosure
> is
> prohibited.  *
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--00000000000098955c056b308b24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After merging your v5 series, this doesn&#39;t look to be =
needed. Let me know if it does still need to be applied.<div><br></div><div=
>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Fri, Apr 27, 2018 at 12:44 PM, Kurt Bodiker <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodiker=
@braintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
TPM Emulator is licensed under GPLv2.=C2=A0 Bitbake does not consider GPL a=
<br>
valid license, so it throws a warning.=C2=A0 Fix that.<br>
<br>
Signed-off-by: Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-u=
s.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
---<br>
This patch is to be applied after applying the Xen vTPM patch series. It<br=
>
corrects the license applicable to the TPM Emulator which I had<br>
incorrectly listed in the recipe as GPL to the correct license type of<br>
GPLv2.<br>
<br>
=C2=A0recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"=
noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" =
rel=3D"noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a> b/recip=
es-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a><br>
index 7207676..f626929 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"=
noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"=
noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a><br>
@@ -3,7 +3,7 @@<br>
<br>
=C2=A0DESCRIPTION =3D &quot;TPM Emulator&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://xenbits.xen.org/xen-extfiles" re=
l=3D"noreferrer" target=3D"_blank">http://xenbits.xen.org/xen-<wbr>extfiles=
</a>&quot;<br>
-LICENSE =3D &quot;GPL&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README;md5=3D<wbr>eeabd77cf8fd8a8bc=
42983884cb098<wbr>63&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
-- <br>
2.14.2<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
<br>
*This email and all attachments are considered confidential and the <br>
proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized disclosu=
re is <br>
prohibited.=C2=A0 *<br>
-- <br>
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

--00000000000098955c056b308b24--
