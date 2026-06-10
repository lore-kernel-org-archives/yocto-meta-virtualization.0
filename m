Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2775CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:33:09 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23285.1781105588167159169
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pnE8N0OM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7e2fd65f968so64672497b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781105587; cv=none;
        d=google.com; s=arc-20240605;
        b=eGt/TT5jGfu13JVfVxdnvTz1z2ToSDOYlFB11zftqKPcZSqmMCFXr/cOgxKh8CeVnZ
         QsOKkXjY6DN1X1500zeMY53iN6daMxa/9TPUVgWWA5QLcgt4DYLqMDTOiCBSmUIHhC8x
         WWZaJ8t8nZfvpe0gAdOvt0hnC4p/FeC9FB6uP5X3JSxFu1nP4LDnZ/4ORSQKfNlgABqo
         HLpd5zxwRQGT5tIa5JgtZ1rg7H9hc1ThU0VNUeqDrlhzjdVFvO5TWWhFc6eNxexa4vzr
         bIn77fiNJwG3KChFwsAVeB79T4SdKu5N6g5FiChvu225Bnfhaua7YRR/zmPPrxl/RkNe
         WIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OH+qxQzbUq4bl6bR3uFLQAI9QheNuyPBw+ctTTyT78M=;
        fh=dvd7mMcEXNuVjtGuWrSwbgVLPxl3qm3OqAecPaUVlh8=;
        b=HrJ08atR1p/pq+lVCqTS2OQI+578MpzCNo2uoBTrM1GSHowBtMpzAV/FStoKtjAr9v
         wTBcpXcIiWHckO3gkaXtlGrXyzUw/DmgVsJsyWxxCquG+51xLVgPUdmnx/7z1vHWcnnV
         cIkGF8LZ/zxRhECkO7qX2GTs4ZHANLsMihCeX7VKXOLoK1IuzMJESQt4vYp/xpUF2WJY
         k1TZAG7GWtP4yGENxcOrTGjHaZZVuS5/1H+pquQYhtSxuSJpPW8iePmnKDin7KWTRLSm
         Olh8qqCL7wvJPSrDtvEkojrTfRT3f8IFsCRkJXsAP1iI5UuPtWBAh/B/aSq2ozCCk+AC
         f2Rw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781105587; x=1781710387; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OH+qxQzbUq4bl6bR3uFLQAI9QheNuyPBw+ctTTyT78M=;
        b=pnE8N0OMb6yh8xx4ASVf8bIgTDWa1lM21COwEgOVydS7YCNplwCpSbsYUBLlGGWJ08
         XqpJDTryYY5pMHBgL3jk5dni7Mgm2CgbEYComtigyLptduyPexq1CtGt7pGZQosob7z9
         a75kJ7It6BUTIIzS/nUVGlqpNF5DlNTi39K5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781105587; x=1781710387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH+qxQzbUq4bl6bR3uFLQAI9QheNuyPBw+ctTTyT78M=;
        b=YTKr8eNCu93ZEYm3PYUHYIDN3qY3CEIvMry8Y2JxkzG7esH76mKoTa+AtPIsYRccJl
         08BtjE4B99c8UW3DTtHlImrFm69H46iEEPiTcvRjxDSt3+3Z4JUR7YASkE2DcEPKt6Vh
         Ix5HnqK8WSdt9BHVRNwaXy034J6Qx+hPqgTEDIleeq8ZTbbXW8BEpQpR0vwssQUT/mdZ
         Ju8uZ5u1ZvVLzG5spSrd1n8u7Glw2BQYU5kxSPHB6DyQvX1j0OYPhh662YnhoQy+OmpJ
         3Ofzhoqrkky0inW1OiIQud+NfV4yQ4DGpp2BgsTpefddenjB2WalqmWUce1js3yswPZM
         YLsw==
X-Forwarded-Encrypted: i=1; AFNElJ9YA3vnyXmUfDTGwLDovdiMCozC7yOJFqh8ubL+Z3ZMbywgN24oeAuMKYXxEIuUPUlZwLVw8dUyhAI21Mbm9irtZXcM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyqH0mTkJ6bSzD+05qzSF09lFNIFUuSkivCY7AlXyGS17nx+ZO5
	epze77lVI6wR8U4MXOTEaCoHEcKMqbN4vd3TMzWY/O+CMt+KmLHT1WYWvde8uAM41wO3s/pMJCS
	RTgEA9gcv+eYWfWVYDf5g4nuci5KRPQ9S/8rtrVdzLQ==
X-Gm-Gg: Acq92OGZhJqEXML+RUC7EQsJrbi3wRRlkdXFmSIg6Isj62VGCtVXKXozr77uX1Ngfkv
	KrjjpaZJGHHyH+lMOeGzxtK+XQQm9+iQH738Spe7/v/OS5piqZf9Ro+gbhNEqT/eQMkALXjuTRB
	OxU4KC2UG9K+dOrUbwRWPbjSzXFJVlltH8Ahy6ZHA04hYa5zVGt2s66iQjDaXHoB7s9vdfw2mH5
	e0RGbSLJrCilfs6VLqDQEr9vj1nyy/CRroIPOqvwEeOhb7ZPDB/VvswZt90x9Rd70iDkFfXyDeB
	dEsGUpE8QM+aRhRwGg==
X-Received: by 2002:a05:690c:6301:b0:7db:d730:4b8c with SMTP id
 00721157ae682-7f2b754af96mr79984577b3.32.1781105586952; Wed, 10 Jun 2026
 08:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260604004120.97156-1-tim.orling@konsulko.com>
 <20260604004120.97156-2-tim.orling@konsulko.com> <CADkTA4MAogwK=33xi8bMizQjtSbOfX=BjDhAx8nAtcG1aNxE+A@mail.gmail.com>
In-Reply-To: <CADkTA4MAogwK=33xi8bMizQjtSbOfX=BjDhAx8nAtcG1aNxE+A@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 10 Jun 2026 08:32:56 -0700
X-Gm-Features: AVVi8CdVnbzOUVoixr3SdPu_CUEw11yTSoldRy2bj2AyYeebsMbWHZaKcrWZhAk
Message-ID: <CAOyo-84tX+BaVOjxxEZq7bG3pUJtrhAb1MkDeKHwAcGXz+UgFA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] container-image-multiarch: add
 helper recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d16cf00653e7f569"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:33:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9860

--000000000000d16cf00653e7f569
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:53=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> While I wait for my system level testing to complete, I'm going through
> the pending patches.
>
> This one brought a question to mind.
>
> On Wed, Jun 3, 2026 at 8:41=E2=80=AFPM Tim Orling via lists.yoctoproject.=
org
> <ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> Similar to core-image-ptest.bb, this recipe uses mcextend to add
>> multiarch support for any recipe in CONTAINER_IMAGES variable which is
>> populated by the CONTAINER_IMAGES_META_VIRT variable in
>> container-image-packagelists.inc.
>>
>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> ---
>>  .../images/container-image-multiarch.bb       | 25 +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 recipes-containers/images/
>> container-image-multiarch.bb
>>
>> diff --git a/recipes-containers/images/container-image-multiarch.bb
>> b/recipes-containers/images/container-image-multiarch.bb
>> new file mode 100644
>> index 00000000..d3b586f4
>> --- /dev/null
>> +++ b/recipes-containers/images/container-image-multiarch.bb
>> @@ -0,0 +1,25 @@
>> +inherit features_check
>> +REQUIRED_DISTRO_FEATURES =3D "vcontainer"
>> +
>> +require conf/distro/include/container-image-packagelists.inc
>> +
>> +DESCRIPTION +=3D "Enable building the ${MCNAME} multiarch image."
>> +SUMMARY ?=3D "${MCNAME} multiarch image."
>> +HOMEPAGE ?=3D "https://www.yoctoproject.org/"
>> +LICENSE ?=3D "MIT"
>> +LIC_FILES_CHKSUM ?=3D
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420"
>> +
>> +
>> +CONTAINER_IMAGES =3D "${CONTAINER_IMAGES_META_VIRT}"
>>
>
> This seems oddly tightly coupled to the .inc in the other patch. What's
> the value
> of that list being in the .inc and then consuming it here (when there are
> no other
> consumers).
>

You bring up a good point. In the ptest case there are multiple recipes
(core-image-ptest, core-image-ptest-fast, core-image-ptest-all), but in our
case we only have one consumer (containers-image-multiarch).


>
> What would be the future consumers of the variable/list ?
>
> If this was to be something overridable, shouldn't that be a ?=3D
> assignement ?
>

Also a good point. I'll fix both in v2.


>
> Bruce
>
>
>
>> +
>> +inherit oci-multiarch
>> +
>> +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in
>> d.getVar('CONTAINER_IMAGES').split()])}"
>> +
>> +OCI_MULTIARCH_RECIPE =3D "${MCNAME}"
>> +OCI_MULTIARCH_PLATFORMS =3D "aarch64 x86_64"
>> +
>> +python () {
>> +    if not d.getVar("MCNAME"):
>> +        raise bb.parse.SkipRecipe("No class extension set")
>> +}
>> --
>> 2.54.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9848):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9848
>> Mute This Topic: https://lists.yoctoproject.org/mt/119639260/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--000000000000d16cf00653e7f569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, =
2026 at 2:53=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div =
style=3D"font-size:small">While I wait for my system level testing to compl=
ete, I&#39;m going through the pending patches.</div><div style=3D"font-siz=
e:small"><br></div><div style=3D"font-size:small">This one brought a questi=
on=C2=A0to mind.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Jun 3, 2026 at 8:41=E2=80=AFPM Tim Orling via=
 <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctopro=
ject.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.=
org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Similar to <a href=
=3D"http://core-image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-i=
mage-ptest.bb</a>, this recipe uses mcextend to add<br>
multiarch support for any recipe in CONTAINER_IMAGES variable which is<br>
populated by the CONTAINER_IMAGES_META_VIRT variable in<br>
container-image-packagelists.inc.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../images/<a href=3D"http://container-image-multiarch.bb" rel=3D"nor=
eferrer" target=3D"_blank">container-image-multiarch.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 25 +++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/images/<a href=3D"http://contai=
ner-image-multiarch.bb" rel=3D"noreferrer" target=3D"_blank">container-imag=
e-multiarch.bb</a><br>
<br>
diff --git a/recipes-containers/images/<a href=3D"http://container-image-mu=
ltiarch.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.=
bb</a> b/recipes-containers/images/<a href=3D"http://container-image-multia=
rch.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.bb</=
a><br>
new file mode 100644<br>
index 00000000..d3b586f4<br>
--- /dev/null<br>
+++ b/recipes-containers/images/<a href=3D"http://container-image-multiarch=
.bb" rel=3D"noreferrer" target=3D"_blank">container-image-multiarch.bb</a><=
br>
@@ -0,0 +1,25 @@<br>
+inherit features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;vcontainer&quot;<br>
+<br>
+require conf/distro/include/container-image-packagelists.inc<br>
+<br>
+DESCRIPTION +=3D &quot;Enable building the ${MCNAME} multiarch image.&quot=
;<br>
+SUMMARY ?=3D &quot;${MCNAME} multiarch image.&quot;<br>
+HOMEPAGE ?=3D &quot;<a href=3D"https://www.yoctoproject.org/" rel=3D"noref=
errer" target=3D"_blank">https://www.yoctoproject.org/</a>&quot;<br>
+LICENSE ?=3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9=
cfbcb788c80a0384361b4de20420&quot;<br>
+<br>
+<br>
+CONTAINER_IMAGES =3D &quot;${CONTAINER_IMAGES_META_VIRT}&quot;<br></blockq=
uote><div><br></div><div><div style=3D"font-size:small">This seems oddly ti=
ghtly coupled to the .inc in the other patch. What&#39;s the value</div><di=
v style=3D"font-size:small">of that list being in the .inc and then consumi=
ng it here (when there are no other</div><div style=3D"font-size:small">con=
sumers).</div></div></div></div></blockquote><div><br>You bring up a good p=
oint. In the ptest case there are multiple recipes (core-image-ptest, core-=
image-ptest-fast, core-image-ptest-all), but in our case we only have one c=
onsumer (containers-image-multiarch).</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">What would be the future consumers of the variable/list ?</div><div s=
tyle=3D"font-size:small"><br></div><div style=3D"font-size:small">If this w=
as to be something overridable, shouldn&#39;t that be a ?=3D assignement ?<=
/div></div></div></div></blockquote><div><br>Also a good point. I&#39;ll fi=
x both in v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+inherit oci-multiarch<br>
+<br>
+BBCLASSEXTEND =3D &quot;${@&#39; &#39;.join([&#39;mcextend:&#39;+x for x i=
n d.getVar(&#39;CONTAINER_IMAGES&#39;).split()])}&quot;<br>
+<br>
+OCI_MULTIARCH_RECIPE =3D &quot;${MCNAME}&quot;<br>
+OCI_MULTIARCH_PLATFORMS =3D &quot;aarch64 x86_64&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not d.getVar(&quot;MCNAME&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;No class exten=
sion set&quot;)<br>
+}<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9848): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9848" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9848</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119639260/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119639260/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div></div>

--000000000000d16cf00653e7f569--

