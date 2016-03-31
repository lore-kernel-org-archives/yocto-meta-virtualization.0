Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79280E00C2D; Thu, 31 Mar 2016 06:14:33 -0700 (PDT)
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
	*      [209.85.214.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CB5CE00BBF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:14:30 -0700 (PDT)
Received: by mail-ob0-f173.google.com with SMTP id kf9so97622607obc.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=GRsMUlfYAXLiUV9LY3x3rgdVsc7ArcUnwb5dpbUglU8=;
	b=qtasn87A5NTwPEB1uBeZUp8piWncj27liqJpXx8ArSZrhK13pGVXqHckg6adZTYRFS
	UOjatLIke4qLqex5+oVMgZ33G4YQLdGubrhA1QTsiPRJJd9xu2e+ymt5pNBOGbOkJm1Y
	ILxZgdo6qlCBZj1/Fr4ZMYC2swwgklZSzTURfE3DbPa0TCYXLsQObfhUT4y6H1UqoIII
	TNR0FCWfgDJcR4HLvsaTV0sQKy25X/U/Jnztr5RjEA3z4ewPbFbOPFGsvDeE95htGLAA
	owEw3Mp34Qcbl2FFv+uEf8A/NPHTcNRO7ofmYuWbJH2UBuzof6+l4UOLulsfPQOx8ItK
	h4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=GRsMUlfYAXLiUV9LY3x3rgdVsc7ArcUnwb5dpbUglU8=;
	b=Pr2mdTvi0M433UKK7hrVpIKZaU11jtiqUapUxIOH0Xh6jferfAmPOtIQ6mtxpAtTe2
	wo6OLPf//sMWtZAfVsoHvfrRM4jw4IFlVnaJdsQ5WCUPbmyroM4pFbLuBxoYBU80Pkr3
	ezhTWDNJnujEcTU0zQK8076p1ua413yc3Q93NHXXXIDZtCcFkOJimMFjNQnxtncq9UQW
	9b3G/o89rd8YjkCjSj8enPQUpp84+x5l+tR/UQvAqSnXybnk9w80pPAFIqyugvGyBJ+a
	OcXnAgpr1qwi8ifYfUR+0jvV9JbhdBnyy1mWRdYwNix3iyT5RqVxLTpbfnO+C8Uy1uVN
	ZwZQ==
X-Gm-Message-State: AD7BkJIxaxZkKyD4p3m4GrHHRFjKwRlsLj2LXzsJo3+fV6Ovv+nQZX/SxQkyPBLzlOOVE0wvwCScP8Nz7fdugg==
MIME-Version: 1.0
X-Received: by 10.60.96.74 with SMTP id dq10mr1089828oeb.48.1459430069748;
	Thu, 31 Mar 2016 06:14:29 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 31 Mar 2016 06:14:29 -0700 (PDT)
In-Reply-To: <1459277188-27287-1-git-send-email-cjp256@gmail.com>
References: <1459277188-27287-1-git-send-email-cjp256@gmail.com>
Date: Thu, 31 Mar 2016 09:14:29 -0400
Message-ID: <CADkTA4MdYvJSJosnFzf5KYfCOFkAeXYmkEKLVAQQWj=WVQ8S4A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: deploy efi binary, if present
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
X-List-Received-Date: Thu, 31 Mar 2016 13:14:33 -0000
Content-Type: multipart/alternative; boundary=089e01177a6de1c876052f580a9f

--089e01177a6de1c876052f580a9f
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 29, 2016 at 2:46 PM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
>
merged.

Bruce


> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9ae7c4e..de8c168 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -901,12 +901,19 @@ pkg_postinst_${PN}-volatiles() {
>
>  do_deploy() {
>      install -d ${DEPLOYDIR}
> +
>      if [ -f ${D}/boot/xen ]; then
>          install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
>      fi
> +
>      if [ -f ${D}/boot/xen.gz ]; then
>          install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
>      fi
> +
> +    if [ -f ${D}/usr/lib64/efi/xen.efi ]; then
> +        install -m 0644 ${D}/usr/lib64/efi/xen.efi
> ${DEPLOYDIR}/xen-${MACHINE}.efi
> +    fi
> +
>      # Install the flask policy in the deploy directory if it exists
>      if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
>          install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
> --
> 2.1.4
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

--089e01177a6de1c876052f580a9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 29, 2016 at 2:46 PM, Chris Patterson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chris Patterson &=
lt;<a href=3D"mailto:pattersonc@ainfosec.com">pattersonc@ainfosec.com</a>&g=
t;<br>
<br></blockquote><div><br></div><div>merged.</div><div><br></div><div>Bruce=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 9ae7c4e..de8c168 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -901,12 +901,19 @@ pkg_postinst_${PN}-volatiles() {<br>
<br>
=C2=A0do_deploy() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${DEPLOYDIR}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if [ -f ${D}/boot/xen ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D}/boot/xen ${DEPLOYDIR=
}/xen-${MACHINE}<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if [ -f ${D}/boot/xen.gz ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D}/boot/xen.gz ${DEPLOY=
DIR}/xen-${MACHINE}.gz<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 if [ -f ${D}/usr/lib64/efi/xen.efi ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${D}/usr/lib64/efi/xen.efi ${D=
EPLOYDIR}/xen-${MACHINE}.efi<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Install the flask policy in the deploy directory if i=
t exists<br>
=C2=A0 =C2=A0 =C2=A0if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D}/boot/${FLASK_POLICY_=
FILE} ${DEPLOYDIR}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--089e01177a6de1c876052f580a9f--
