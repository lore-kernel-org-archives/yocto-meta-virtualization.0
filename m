Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428D7FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 14:34:41 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14557.1777386870326897519
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 07:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y26Q8j+1;
 spf=pass (domain: konsulko.com, ip: 209.85.128.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7947cf097c1so107382067b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 07:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386869; cv=none;
        d=google.com; s=arc-20240605;
        b=ER3TWQcSd18RziOLU6HlAqPLAAJRDG5mXb1d6Uq0rPGYGBKsB5f4qRKfmYlDYIKrym
         7qzlGSE9s00J9SaLz3wakgdYg3jwRjJK8V5suar+LnbdCHV868CNRFGkIXf5I3AnK3i5
         TjmkFufKqKRbVAakHRMDG5mg0KuUQ4hn1F2hVqjrOfjEhhcV9aYgs9LNPGOOIH3G1Rc3
         sA1WxRCCxPkMyLwimL9H72SdLeXSiaHuwEgJbEmcPiqFw4l8xIWacD2zM3VotDginHCb
         zodK0vWPm3b7levZxWM6uD+aQHRobJvJ4xl0UHuP2bd2g6TKwk9U5lZWJcJQJDV4dwXI
         ZdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=27rTlv3Zv+yi1pOpxQbWYC4Lb29WZzMypqy85TETuVM=;
        fh=tdn0dS1HV9XabSg+CWi/8NicNYpEnDtBLbLJmODm1eg=;
        b=Egc+CiQr7lwsZ9Pml2ekVuATx91F4nNv6V9uheG6z5+ww2oeOnF6Pc24DAHaO+L7Mr
         FqrA5j3xBteqwDG9OOzRWKvYq4GMmuPfYFiEWxtUQUABYOjfPTxpJSx8/vyNEnI1vf9M
         TzQyOIrcjh+iQIaCQBqDuKrdmwDGqPT4DlaCA/CAM/0FTuNeFxj8yEJqmfEThQ666w0f
         /aPEkWYfSxZ1N2n+b3EEHasNgBPvAnuxMwq7v6DglfX0OvBNiLViDmHQkkrA/TV8bSCU
         L4MIbLXNwK0J6Usubgqwvw+TRxXFhK2Azx39QAjXrR/B+7JoBIh10Y5ZNF6NStcxtMa2
         cJBw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777386869; x=1777991669; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27rTlv3Zv+yi1pOpxQbWYC4Lb29WZzMypqy85TETuVM=;
        b=Y26Q8j+163UKhfqd4jhG5OpUIA03f3sp0DFryKXjBm28XSefhiGQuN6Q2Om2jJvLwJ
         FF4IfLMTv8JOMRILTEGTzapQBX0VuDA0gZepvWpzHyh+4q4tIgptiht9EssZrbchM16A
         wc0U/8gpHens+bYWQPd5O0l98U4FenCh7p3cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386869; x=1777991669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27rTlv3Zv+yi1pOpxQbWYC4Lb29WZzMypqy85TETuVM=;
        b=gPDc9W77OrXtYMfGFhutC84DNq9JTNcuTQJiX9DGkj4zmWDDjQ+f/5IjNW7vy60EwO
         9u8E/9u57ef6EdXowyZeSYIktfjJjAhOWCTFK7uGY5dQsU4QvBCe8SSj76USLn4Pww6o
         WXJweaeUems0Hoest0dvTktM7Msqre5TWsz4dSsXIBMdCG4oY+sP/IW3K43nRw7RQOad
         S7vOpx9zQXc3M65nm+HYpHyQ2w0FNmysq1QpnjijodLjdGSUk5Ki2wCXbnnoGwB0zrqV
         UQAGuonVYUJ4mOY598UgAT9IOR1pBZAGfOpNHJky50hYbb2GtJSdsxMNtT4zWQPQE5sT
         YTzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8o1mkByNzvde+Cuz9uGTQfpEHZPNjpNgN1S1hTH3iZI9mNtzfVPT9mTySfXGaYV2qW/tt5lbOf9JbALA80AMHnrDv5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyZ1/yhxgZgXymjXMaGFazg7t7EeyuyTx5bQa+bM9sAacK+XHhc
	T9AdASSHM6BikD23T79jIWBtbHSraOxonBgk9fwXcgXyLHRlkB69v6mWjoeQ0tb4WBX0/hyIKIO
	E09XjqpUY690Oyra5CRHSR6APY1LDkI/1CTBPvGeYfg==
X-Gm-Gg: AeBDievaqJOxnNIJoKQzDrPfaRQ/rfI+t/EEoNu+weOy2h7Mgw0Np0/yHlGN8+rUwkJ
	qn1e85IJrtjVHgF8toFDVkXI6QKzgFzpwcVfHAMvbcb1kZECvSRXO9rUZexVcbjnoqfCFIlZIEr
	Y3D0tX1ojJM9je5kNbpz86pjx08tDIhg/zyqZYMKnqosj2zcooz3y2gP0LsNuRTlPLzRphqohrX
	61F7hY8yr8D7kiZkz+mTEb0R5zTkkKqTzOCHovQxQsDPkldidazyZHbZEQPg4f7E+xeZGauld00
	qWuddvVHuTiJsgLzxQ==
X-Received: by 2002:a05:690c:c4f1:b0:7ba:f712:95d7 with SMTP id
 00721157ae682-7bcf4fc92admr31470497b3.5.1777386868393; Tue, 28 Apr 2026
 07:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260424172954.53051-1-tim.orling@konsulko.com> <afCf_VP9tmVRa8yG@gmail.com>
In-Reply-To: <afCf_VP9tmVRa8yG@gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Tue, 28 Apr 2026 07:34:16 -0700
X-Gm-Features: AVHnY4JmzEjoNLRNWhgrvOqKxrIq4eTSAM2Yde5NUVwHaya6aAsZVMgWMJhFRZA
Message-ID: <CAOyo-87BEvrbQcntDqoy2oQG+y7URp1ocsd8JBdFBpSbSDEb6w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cosign: add recipe for container
 signing tool v3.0.6
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000eb58ae06508620ab"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 14:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9776

--000000000000eb58ae06508620ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 4:54=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> In message: [meta-virtualization][PATCH] cosign: add recipe for container
> signing tool v3.0.6
> on 24/04/2026 Tim Orling via lists.yoctoproject.org wrote:
>
> > Add cosign [1] recipe for sigstore's [2] container signing, verificatio=
n
> > and storage tool [3]. Includes auto-generated Go module dependencies an=
d
> > license tracking via go-mod-update-modules.
> >
> > [1] https://github.com/sigstore/cosign/releases/tag/v3.0.6
> > [2] https://www.sigstore.dev/
> > [3] https://docs.sigstore.dev/cosign/signing/overview/
>
> I've been using my own hybrid technique for gomodules in
> meta-virtualization
> as that allows me to bump dependencies in source verses needing to patch.
>
> Any objections to me attempting to convert it to that format ?
>

Feel free to improve the recipe. I'll try to learn from your changes ;)
Thank you!
--Tim


>
> Bruce
>
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  recipes-containers/cosign/cosign-go-mods.inc  | 261 +++++++++++++++++
> >  recipes-containers/cosign/cosign-licenses.inc | 274 ++++++++++++++++++
> >  recipes-containers/cosign/cosign_git.bb       |  19 ++
> >  3 files changed, 554 insertions(+)
> >  create mode 100644 recipes-containers/cosign/cosign-go-mods.inc
> >  create mode 100644 recipes-containers/cosign/cosign-licenses.inc
> >  create mode 100644 recipes-containers/cosign/cosign_git.bb
> >
> > diff --git a/recipes-containers/cosign/cosign-go-mods.inc
> b/recipes-containers/cosign/cosign-go-mods.inc
> > new file mode 100644
> > index 00000000..afd34fc5
> > --- /dev/null
> > +++ b/recipes-containers/cosign/cosign-go-mods.inc
> > @@ -0,0 +1,261 @@
> > +
> > +# This file has been generated by go-mod-update-modules.bbclass
> > +#
> > +# Do not modify it by hand, as the contents will be replaced when
> > +# running the update-modules task.
> > +
> > +SRC_URI +=3D "\
> > +    gomod://
> cloud.google.com/go;version=3Dv0.123.0;sha256sum=3De9c9509cf75beb9516795e=
eb113d01a20e2a71496a66ed736b6ed2a516878d52
> \
> > +    gomod://
> cloud.google.com/go/auth;version=3Dv0.18.2;sha256sum=3D34b85ed8bd9a295eaf=
b429ff3f9eeb7af7102edfe9dc1e3dc60455d7113fd5d3
> \
> > +    gomod://
> cloud.google.com/go/auth/oauth2adapt;version=3Dv0.2.8;sha256sum=3D4cd6426=
4bafc4dd05f645452d6e1485adf92309130bd82b4c595db10cd534963
> \
> > +    gomod://
> cloud.google.com/go/compute/metadata;version=3Dv0.9.0;sha256sum=3Df97e35d=
1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca
> \
> > +    gomod://
> cloud.google.com/go/iam;version=3Dv1.5.3;sha256sum=3Df153dabeb45cbb3fed0f=
840da4394f21818451421cbfb2e28740d7efe87123d1
> \
> > +    gomod://
> cloud.google.com/go/kms;version=3Dv1.26.0;sha256sum=3D702a9069cd88a80f40f=
89b2f1df00ac491ffff1abd47bee36b3734dd280ebf2e
> \
> > +    gomod://
> cloud.google.com/go/longrunning;version=3Dv0.8.0;sha256sum=3D3f7c0501f17f=
58d774611e588d007121c42707dd76b2ffd9577cd870daf44f71
> \
> > +    gomod://
> cuelabs.dev/go/oci/ociregistry;version=3Dv0.0.0-20251212221603-3adeb86638=
19;sha256sum=3D1cc9faec3e7e226dfbb13311ab366e166ad5c343994fb4de74aefc410076=
85a7
> \
> > +    gomod://
> cuelang.org/go;version=3Dv0.16.0;sha256sum=3D8d04731f2b164d0050140a0a649a=
271a0fd5db4377b764cb1bbd168ddadfd3cd
> \
> > +    gomod://
> github.com/AliyunContainerService/ack-ram-tool/pkg/credentials/provider;v=
ersion=3Dv0.14.0;sha256sum=3D90d9986ca69eb9dd2129d13ddc3b4265225dbcf2cf1de5=
ebcbc82ddf0dbc7d75
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go;version=3Dv68.0.0+incompatible;sha256su=
m=3Dc40d67ce49f8e2bbf4ca4091cbfc05bd3d50117f21d789e32cfa19bdb11ec50c
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go/sdk/azcore;version=3Dv1.21.0;sha256sum=
=3D763cf24cc12852b7bab952ac524a30bc7a6047ce6c446397a5b85234f72fccc2
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go/sdk/azidentity;version=3Dv1.13.1;sha256=
sum=3D98012cfee26379a030c430ee2218c396201a9f9a35f17867c6f5c8a7cb6839a5
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go/sdk/internal;version=3Dv1.11.2;sha256su=
m=3D88c28c7f95f1ab392d5bf5e98569b30b834721978e2d7d4dc2eed1bc08f6f4e8
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys;version=3D=
v1.4.0;sha256sum=3D44808d09830b847b6f969fdead1d87cb0b1f6ab5abf146d4dd762dc0=
561bc587
> \
> > +    gomod://
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal;version=
=3Dv1.2.0;sha256sum=3Dfea8b9a6517633da1b023698f9be20868fa21ef5886847bc9a939=
fbac89c7dee
> \
> > +    gomod://
> github.com/Azure/go-autorest;version=3Dv14.2.0+incompatible;sha256sum=3D8=
9ac786da5b108e594bb1fbbf8f39a822fc1d994be1ff7cc6e860e8b45f3d80c
> \
> > +    gomod://
> github.com/Azure/go-autorest/autorest;version=3Dv0.11.29;sha256sum=3Df3e9=
65c991c8205cd97a4616ade8dd0d179f4b849a56420e0dd2bcd8e0d74cec
> \
> > +    gomod://
> github.com/Azure/go-autorest/autorest/adal;version=3Dv0.9.23;sha256sum=3D=
f65e30aa3f755d9c6ce990c9600ddf5094b45659eb57afc4d9750ddf00a553f0
> \
> > +    gomod://
> github.com/Azure/go-autorest/autorest/azure/auth;version=3Dv0.5.12;sha256=
sum=3Dc626f2bd8952bbe98d79080441ec856a2440c7405465da6d7ae6b8ff7ccc2c12
> \
> > +    gomod://
> github.com/Azure/go-autorest/autorest/azure/cli;version=3Dv0.4.6;sha256su=
m=3Dcdc19569bc0dd13c3e52dc9babb064a50d0cf15bf5806357b31ba27b6e52a6be
> \
> > +    gomod://
> github.com/Azure/go-autorest/autorest/date;version=3Dv0.3.0;sha256sum=3D7=
b59c0421eaf8549f20d17aab7e3e4621e1798de1119dac65a04c110d110d64d
> \
> > +    gomod://
> github.com/Azure/go-autorest/logger;version=3Dv0.2.1;sha256sum=3D90c84e12=
6b503027f69d232f4ce5758ae01d08ea729c71539ebff851f2477b49
> \
> > +    gomod://
> github.com/Azure/go-autorest/tracing;version=3Dv0.6.0;sha256sum=3Db7296ba=
64ecae67c83ae1c89da47c6f65c2ff0807027e301daccab32673914b3
> \
> > +    gomod://
> github.com/AzureAD/microsoft-authentication-library-for-go;version=3Dv1.6=
.0;sha256sum=3Db5bd3c20f1152ee71546ed7d11466878f85cef9dee35b47ad6218e621d9c=
c4dc
> \
> > +    gomod://
> github.com/agnivade/levenshtein;version=3Dv1.2.1;sha256sum=3D26bdb12f38a5=
ca1c45a666e8dea1c409189a383443fa14f4ff04f75af7022534
> \
> > +    gomod://
> github.com/alibabacloud-go/alibabacloud-gateway-spi;version=3Dv0.0.4;sha2=
56sum=3D07fec6942fd2a40ecd197fba04920a7893b6313899950f9f06c2254f12c39268
> \
> > +    gomod://
> github.com/alibabacloud-go/cr-20160607;version=3Dv1.0.1;sha256sum=3D218d7=
19db6ddf2d88c0258883c251f708cb8a4696d071a25061f6c646c6d8273
> \
> > +    gomod://
> github.com/alibabacloud-go/cr-20181201;version=3Dv1.0.10;sha256sum=3De895=
c3c0877d704c37c6c5392d3e9986339850f1ee0373c6bc881e48b298f59d
> \
> > +    gomod://
> github.com/alibabacloud-go/darabonba-openapi;version=3Dv0.2.1;sha256sum=
=3Dd39d097d12a30c4a6e7bd4ed640d9c9f81e7722cbf487742c0204efa53506e9a
> \
> > +    gomod://
> github.com/alibabacloud-go/debug;version=3Dv1.0.0;sha256sum=3Dca74856ab94=
c36c0c1631eeedfb5cf8f7d1f2fea44a6cee9e2a611c5955f0762
> \
> > +    gomod://
> github.com/alibabacloud-go/endpoint-util;version=3Dv1.1.1;sha256sum=3D071=
1665f45c66ad2051ee9c08eb0cc59a9c77baacafeea8b791b8eb782c7fa6f
> \
> > +    gomod://
> github.com/alibabacloud-go/openapi-util;version=3Dv0.1.0;sha256sum=3D117c=
207e8e301207ab029cc33fc60e7724ed988ff959935510ee45b1ccf7ee62
> \
> > +    gomod://
> github.com/alibabacloud-go/tea;version=3Dv1.2.1;sha256sum=3Dc3cfbe14863c7=
4bc7ae0edce4de380f0db62d7432bfd4800eb328c135fa03f86
> \
> > +    gomod://
> github.com/alibabacloud-go/tea-utils;version=3Dv1.4.5;sha256sum=3D1390da0=
7d391ce5e34ce7d01b32e44283cd82c52c30cc8e3a694b0e2f3d08ddb
> \
> > +    gomod://
> github.com/alibabacloud-go/tea-xml;version=3Dv1.1.3;sha256sum=3D41202fed6=
a5acef24b413d86ff4977c18008876cfd82d7aa81ee4f4d1334c2ae
> \
> > +    gomod://
> github.com/aliyun/credentials-go;version=3Dv1.3.2;sha256sum=3D4ffe97620cb=
492a48965599a0f6e2e7eebb70a97ae774ade3bede9fc1edff661
> \
> > +    gomod://
> github.com/asaskevich/govalidator;version=3Dv0.0.0-20230301143203-a9d515a=
09cc2;sha256sum=3D0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc10008e466ebe8=
be5dc37
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2;version=3Dv1.41.2;sha256sum=3D02bc90aff4c5db=
96bf3b97c6b898be16ad19850fac6add54bfe8cf47c9456966
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/config;version=3Dv1.32.10;sha256sum=3D6bd6e8=
53abde0a04193c72f3e76a6496aa6e8bb4a31c72936ee6a445bae86dc1
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/credentials;version=3Dv1.19.10;sha256sum=3D3=
db3769e1ece97e7426609583c0404985a07b6346e3b77266ac59c8963bbd7e7
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=3Dv1.18.18;sha256su=
m=3D49f9782b1957811bbcef0f5f23d24d05841b0695c67a012c6f1239e7c0b0e7f9
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/internal/configsources;version=3Dv1.4.18;sha=
256sum=3D30853dfcc993ba7a7d0a9f8436f51dcf70b426abd7d44c817d45f72f1cd85cf3
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=3Dv2.7.18;sha2=
56sum=3D6eb3aa8e1b8288f69fce5d15abd31909064c119bbbf0edcd94bb404018e1f998
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/internal/ini;version=3Dv1.8.4;sha256sum=3Df3=
4dd5f3521bdb07f657b88348bbafbb68f41d134bcb615356122e56c1117600
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/ecr;version=3Dv1.55.3;sha256sum=3D10=
80996028df7bb2e17ce1c1511b5587e8e6522ec4ad73e1e431abe558009d25
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/ecrpublic;version=3Dv1.38.10;sha256s=
um=3D07284fd1309ae2351c22bbe7153ef7f24a128d6197d11b5d747d3ce9c441fd78
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=3Dv=
1.13.5;sha256sum=3Df4365491d985ec3e9c886427643361fcec012e5a8954bc4e36fc73ce=
093ddaf3
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=3Dv1.=
13.18;sha256sum=3D44a24021cd943a2a3410049272a4585cdd804e444a94499efc30c5835=
6c05bab
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/kms;version=3Dv1.50.1;sha256sum=3D29=
a88aad36078661fe4481009b80671dccff222aea241c231813ece4bddf5653
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/signin;version=3Dv1.0.6;sha256sum=3D=
c5ef46f10cac219c82efae68542e3b11c79f745a83836df3be624f812874d3d4
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/sso;version=3Dv1.30.11;sha256sum=3D1=
b4c55e13d47f1af36bdc17e9c8b7eb9b0741e658d65bd6a27b01529b92e578c
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/ssooidc;version=3Dv1.35.15;sha256sum=
=3Dbff63145dbde5c3b40108f65e9165af03db979a37f2cc3235565c5f545abf216
> \
> > +    gomod://
> github.com/aws/aws-sdk-go-v2/service/sts;version=3Dv1.41.7;sha256sum=3D89=
47d4971e55f7c3f0fe037630e509abd91bd0be913e627a10db6da7332cfc14
> \
> > +    gomod://
> github.com/aws/smithy-go;version=3Dv1.24.1;sha256sum=3D7bea6fb2be620fdc7e=
6fd4364478d9eca03e9b130cb2088e300ed2847e26a5ea
> \
> > +    gomod://
> github.com/awslabs/amazon-ecr-credential-helper/ecr-login;version=3Dv0.12=
.0;sha256sum=3D4502354101353d12ef87a27db3afc568865eb10d43c4c5b36b5e172ffb75=
829a
> \
> > +    gomod://
> github.com/blang/semver;version=3Dv3.5.1+incompatible;sha256sum=3D8d03239=
9cf835b93f7cf641b5477a31a002059eed7888a775f97bd3e9677ad3c
> \
> > +    gomod://
> github.com/buildkite/agent/v3;version=3Dv3.118.0;sha256sum=3D6ded12a893b9=
b0881f6061d1a0fdc7a3f9d7ef4691fb6490d82d381c80aaa97b
> \
> > +    gomod://
> github.com/buildkite/go-pipeline;version=3Dv0.16.0;sha256sum=3Dfcc049d51d=
c8778f57571df98af46fc3e30b31a39466ee95abd29aad7b9501a0
> \
> > +    gomod://
> github.com/buildkite/interpolate;version=3Dv0.1.5;sha256sum=3Df7f46fd8fa1=
41675b86e663841f649242422e61f29c86ce8831bdf53ecbd3683
> \
> > +    gomod://
> github.com/buildkite/roko;version=3Dv1.4.0;sha256sum=3De87591105481365401=
4a84a90317927a5e6a248f3fd2b0d56a6c3b815c610e0a
> \
> > +    gomod://
> github.com/cenkalti/backoff/v4;version=3Dv4.3.0;sha256sum=3Def220b1ebf3bf=
f4c46bbad5b2e123030e812b722b9e9dc88bc35956f9c622c2a
> \
> > +    gomod://
> github.com/cenkalti/backoff/v5;version=3Dv5.0.3;sha256sum=3D58e4d9014277b=
c1c5c7ab64539137923964cc3920303a4f771d02a532939bedb
> \
> > +    gomod://
> github.com/cespare/xxhash/v2;version=3Dv2.3.0;sha256sum=3D145a26cdc7c49db=
566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3
> \
> > +    gomod://
> github.com/chrismellard/docker-credential-acr-env;version=3Dv0.0.0-202303=
04212654-82a0ddb27589;sha256sum=3D50a1e7708257a9014d9463fb5ae1401da96859a84=
a3e91ed861b3cc5830d2329
> \
> > +    gomod://
> github.com/clbanning/mxj/v2;version=3Dv2.7.0;sha256sum=3D4451f64589cac692=
c9caa68be16551d6391949379a5bceae5455070198dd0918
> \
> > +    gomod://
> github.com/cockroachdb/apd/v3;version=3Dv3.2.1;sha256sum=3D6ad54bb71a36fb=
a8ca6725a00d916e51815a4c68de54096313ca6fffda6c87c2
> \
> > +    gomod://
> github.com/common-nighthawk/go-figure;version=3Dv0.0.0-20210622060536-734=
e95fb86be;sha256sum=3Dd0e1080f421d295735e6084ca0879bcf00b059d2af2246679be96=
a230b71c456
> \
> > +    gomod://
> github.com/containerd/stargz-snapshotter/estargz;version=3Dv0.18.2;sha256=
sum=3D3ba05758c81ad89701d66bb34a9025e688d3e6b58784c2cbb4c6adfbae574435
> \
> > +    gomod://
> github.com/coreos/go-oidc/v3;version=3Dv3.17.0;sha256sum=3Dfba667f687448a=
228315d6f0cfd00a5fa9ab8ad9b511e38575a699afc0b30aeb
> \
> > +    gomod://
> github.com/cyberphone/json-canonicalization;version=3Dv0.0.0-202412131021=
44-19d51d7fe467;sha256sum=3D9492fa89d9f2543890346672d239c494ccba4073be51f33=
8b50e8f749792e25a
> \
> > +    gomod://
> github.com/davecgh/go-spew;version=3Dv1.1.2-0.20180830191138-d8f796af33cc=
;sha256sum=3Db4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb24841=
28
> \
> > +    gomod://
> github.com/digitorus/pkcs7;version=3Dv0.0.0-20230818184609-3a137a874352;s=
ha256sum=3Dc4c8c4f4f331709c7c9dc40035fa0a9c23c98e8a7777cfaafe2013301e69bbfb
> \
> > +    gomod://
> github.com/digitorus/timestamp;version=3Dv0.0.0-20231217203849-220c5c2851=
b7;sha256sum=3D0e79eb53bb9d500f26e33a58bb0cced31d72f91b3205c7685e6126cce267=
c683
> \
> > +    gomod://
> github.com/dimchansky/utfbom;version=3Dv1.1.1;sha256sum=3D0c1a11101602d5f=
57ac3e790c0b72e09ff87d8d535535f43fbee9e6a42327350
> \
> > +    gomod://
> github.com/docker/cli;version=3Dv29.3.0+incompatible;sha256sum=3D2612c3a3=
b39af2662e22ff8c55c6bea681191e6174e3ef3995de81135631424a
> \
> > +    gomod://
> github.com/docker/distribution;version=3Dv2.8.3+incompatible;sha256sum=3D=
8f08722c5459cb4d9aa006e1fae094997da372098f4e14a59215b1ed3d48738a
> \
> > +    gomod://
> github.com/docker/docker-credential-helpers;version=3Dv0.9.5;sha256sum=3D=
2a01551502cf37b523c7137d92ec8fbc99aaa5a4b83b2b8f27fb0b47a394b3c5
> \
> > +    gomod://
> github.com/dustin/go-humanize;version=3Dv1.0.1;sha256sum=3D319404ea84c8a4=
e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46
> \
> > +    gomod://
> github.com/emicklei/go-restful/v3;version=3Dv3.13.0;sha256sum=3D06bd60484=
b324de0b8e4366d4ed326db2e1dc730459b46e19a5306a108439c77
> \
> > +    gomod://
> github.com/emicklei/proto;version=3Dv1.14.3;sha256sum=3Dbb06405e5df4c1b41=
a7f962866e9d50866f9f9bd6b7e2282938b3b57bcaf556e
> \
> > +    gomod://
> github.com/felixge/httpsnoop;version=3Dv1.0.4;sha256sum=3D75aa471311265e9=
860df0e523400b4650ed0c1a33262786a421f07226792e494
> \
> > +    gomod://
> github.com/fsnotify/fsnotify;version=3Dv1.9.0;sha256sum=3D94e64824b23591b=
7aa504e3321d5ec3f57de88f4d49882eaefbbf6820dab746e
> \
> > +    gomod://
> github.com/fxamacker/cbor/v2;version=3Dv2.9.0;sha256sum=3D5b0ec6424bd522a=
eeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a
> \
> > +    gomod://
> github.com/go-chi/chi/v5;version=3Dv5.2.5;sha256sum=3Df78c1525f8b3af815bc=
f3406c0aba1f272eff96413ff51874677bf8a314fcad8
> \
> > +    gomod://
> github.com/go-jose/go-jose/v4;version=3Dv4.1.4;sha256sum=3D06a37b6668012a=
2dd109a5f71f6ae15387dc808b35d3cf73f5e406e78a17b027
> \
> > +    gomod://
> github.com/go-logr/logr;version=3Dv1.4.3;sha256sum=3D523d7a3587fe73f61ef4=
1c8bc627f7d7f38de8104d46278154b307e60770ad70
> \
> > +    gomod://
> github.com/go-logr/stdr;version=3Dv1.2.2;sha256sum=3D9dd6893bf700198485ae=
699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef
> \
> > +    gomod://
> github.com/go-openapi/analysis;version=3Dv0.24.3;sha256sum=3D9d0a3b9a0fe1=
4bb4b4880d93f98c459921d1ec4bcd160c1de23433c24285f7e5
> \
> > +    gomod://
> github.com/go-openapi/errors;version=3Dv0.22.7;sha256sum=3D815a7979d3e3c7=
048b8bcb82d59c9e3de4fc7882c7de3a9b9e94eea02fba2651
> \
> > +    gomod://
> github.com/go-openapi/jsonpointer;version=3Dv0.22.5;sha256sum=3Dc77c1b572=
29c8d8cdd8d17a7137dbb44e10ec8aa1e24691bb380485b759a4e37
> \
> > +    gomod://
> github.com/go-openapi/jsonreference;version=3Dv0.21.5;sha256sum=3De451bfc=
44c231ea285921a412f63b47518c3529cc29ba3a67d8293a9e57f0bb8
> \
> > +    gomod://
> github.com/go-openapi/loads;version=3Dv0.23.3;sha256sum=3D51a80f3cdfdc4b1=
2ee2c7bac33395e031dbfcc7673d3087d91cd77506a729eb9
> \
> > +    gomod://
> github.com/go-openapi/runtime;version=3Dv0.29.3;sha256sum=3D238a196a270d2=
24d4e558719e8ac0606d4d1729cb9f31957584fe14cac179e9f
> \
> > +    gomod://
> github.com/go-openapi/spec;version=3Dv0.22.4;sha256sum=3D3a0ed5b0ee766e01=
758a08afb06ae7d0ca9b1a877528a4e3c94056634d5534d8
> \
> > +    gomod://
> github.com/go-openapi/strfmt;version=3Dv0.26.0;sha256sum=3D82d8e99220f9ab=
4fd7d53ccf5fe96638f8b18858d18e994434f358d10dc95d12
> \
> > +    gomod://
> github.com/go-openapi/swag;version=3Dv0.25.5;sha256sum=3Daa93ca1f6074ff1d=
4abb336a41db19e5c8e6be2391bc207b4bb9ee20c7bebd6d
> \
> > +    gomod://
> github.com/go-openapi/swag/cmdutils;version=3Dv0.25.5;sha256sum=3Dc9b01c6=
c9aad8e72c59a570c8acc140e8f0522ce57322b3bf81dfdf0f73e54e8
> \
> > +    gomod://
> github.com/go-openapi/swag/conv;version=3Dv0.25.5;sha256sum=3Dc02fe7118d5=
8720cbd83bc7c0c37edd5bdaff731f26f8ca8bc8998ee1e0f39b2
> \
> > +    gomod://
> github.com/go-openapi/swag/fileutils;version=3Dv0.25.5;sha256sum=3Df36851=
1a4eda5e14680aaa358b0b6fd2ca23cfc61aa8bfec234acb51ec9c4561
> \
> > +    gomod://
> github.com/go-openapi/swag/jsonname;version=3Dv0.25.5;sha256sum=3Dfff4d3d=
3875709813d6fcd5657133de4331eb136a0aedd51a099f7f76605ae08
> \
> > +    gomod://
> github.com/go-openapi/swag/jsonutils;version=3Dv0.25.5;sha256sum=3D9d6fad=
8614363682c676c5380433d6f376ddcbfe09af5d5b1e92db57eb3f89a6
> \
> > +    gomod://
> github.com/go-openapi/swag/loading;version=3Dv0.25.5;sha256sum=3D08db0dfa=
32b02d4575d202a43c2cbf547b55e1cc1700b83b50e2bd6963fe473b
> \
> > +    gomod://
> github.com/go-openapi/swag/mangling;version=3Dv0.25.5;sha256sum=3De18e5bf=
564ca56e0534593b39c694030a1700ccb75d4d9597633310d01c3032f
> \
> > +    gomod://
> github.com/go-openapi/swag/netutils;version=3Dv0.25.5;sha256sum=3D7272f9e=
0ccb481ce99f5189ec73c91fcb5b716d3cea7265faa433f78220c09bb
> \
> > +    gomod://
> github.com/go-openapi/swag/stringutils;version=3Dv0.25.5;sha256sum=3D84c6=
7b1424ec75a3c98c4f8403215212dc8234a2ca49bfc4cd2948c4c0f474fc
> \
> > +    gomod://
> github.com/go-openapi/swag/typeutils;version=3Dv0.25.5;sha256sum=3De9561c=
699417276b878b22967f457f29acc80b9ce5f977dc520637dd419f0c4a
> \
> > +    gomod://
> github.com/go-openapi/swag/yamlutils;version=3Dv0.25.5;sha256sum=3Daf4b90=
aa0549f31d619676f1642fc70b5aeb62a7ae8895a5b0d8225e2d02d09a
> \
> > +    gomod://
> github.com/go-openapi/validate;version=3Dv0.25.2;sha256sum=3Dce569ad32c22=
f253dde70de305edbfe595f7c9c19816636451623b94ac5d9f63
> \
> > +    gomod://
> github.com/go-viper/mapstructure/v2;version=3Dv2.5.0;sha256sum=3D326f8e00=
f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547
> \
> > +    gomod://
> github.com/gobwas/glob;version=3Dv0.2.3;sha256sum=3D0cfe486cd63d45ed4cb58=
63ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf
> \
> > +    gomod://
> github.com/golang/snappy;version=3Dv0.0.4;sha256sum=3Dea4545ca44ee9905540=
94df6de440386a440a5bd99106e048939409d63beb423
> \
> > +    gomod://
> github.com/golang-jwt/jwt/v4;version=3Dv4.5.2;sha256sum=3Dec5ee69a31fd478=
fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f
> \
> > +    gomod://
> github.com/golang-jwt/jwt/v5;version=3Dv5.3.0;sha256sum=3D7de1cf03d836b3f=
cb32e02011d148fe94533e52dd54d521cadc61bcdf068eb1c
> \
> > +    gomod://
> github.com/google/certificate-transparency-go;version=3Dv1.3.3;sha256sum=
=3D2728bdcc12bd62dfa29cbc5211dd4e25ca471a806dd0ab2400177a9a45733641
> \
> > +    gomod://
> github.com/google/gnostic-models;version=3Dv0.7.0;sha256sum=3D797a05cd73a=
30624ece79633c4db4631676adc1f30f07a0a7051ab39beca96c8
> \
> > +    gomod://
> github.com/google/go-cmp;version=3Dv0.7.0;sha256sum=3D64a9ce046f2c320e378=
3fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
> \
> > +    gomod://
> github.com/google/go-containerregistry;version=3Dv0.21.3;sha256sum=3D860a=
c1d37ac6ace9401e28e7292cebfd9425ea171f1f02c298369665c46b6de9
> \
> > +    gomod://
> github.com/google/go-github/v73;version=3Dv73.0.0;sha256sum=3D82da258d807=
e9be4bc3993e3909577de3ec3b676e83ee6f28a9a1aef7a46137d
> \
> > +    gomod://
> github.com/google/go-querystring;version=3Dv1.2.0;sha256sum=3D57b7ce2b82b=
33c68f59a224c6dd1305753e5ee3eecbefd09d43423a14f541e31
> \
> > +    gomod://
> github.com/google/s2a-go;version=3Dv0.1.9;sha256sum=3Dbf8f4b159d3fc201477=
822ed2514e4f05f58c764b78ffed73ec0accce5fb7f07
> \
> > +    gomod://
> github.com/google/uuid;version=3Dv1.6.0;sha256sum=3Dd0f02f377217f42702e25=
9684e06441edbf5140dddcc34ba9bea56038b38a6ed
> \
> > +    gomod://
> github.com/googleapis/enterprise-certificate-proxy;version=3Dv0.3.12;sha2=
56sum=3D5e0f2acd75886d11b2cea9903e908af8fddd64cf9a53a9bf40a48e8ff30f4a96
> \
> > +    gomod://
> github.com/googleapis/gax-go/v2;version=3Dv2.17.0;sha256sum=3D76216728284=
61256b38091fefcf55056940c910188d51240874fd7e6f8432e93
> \
> > +    gomod://
> github.com/grpc-ecosystem/grpc-gateway/v2;version=3Dv2.27.7;sha256sum=3Dc=
f582c8973dab45fed618da990044ac04893d038694fe4e6bddd3dc44641fef4
> \
> > +    gomod://
> github.com/hashicorp/errwrap;version=3Dv1.1.0;sha256sum=3D209ae99bc039443=
e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c
> \
> > +    gomod://
> github.com/hashicorp/go-cleanhttp;version=3Dv0.5.2;sha256sum=3De9f3dcfcb3=
3172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df
> \
> > +    gomod://
> github.com/hashicorp/go-multierror;version=3Dv1.1.1;sha256sum=3D972cd841e=
e51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c
> \
> > +    gomod://
> github.com/hashicorp/go-retryablehttp;version=3Dv0.7.8;sha256sum=3D9e2c17=
5e4af37cdfeba28ed89250ad1fd691eda0fab167fafa9928222646b71e
> \
> > +    gomod://
> github.com/hashicorp/go-rootcerts;version=3Dv1.0.2;sha256sum=3D864a48e642=
e87a273fb5ef60bb3575bd74a7090510f93143163fa6700be31948
> \
> > +    gomod://
> github.com/hashicorp/go-secure-stdlib/parseutil;version=3Dv0.2.0;sha256su=
m=3D715aecec5d925467704774d3ab4bd3c4eead5ddb525a4bceb06c6f1e697ddba8
> \
> > +    gomod://
> github.com/hashicorp/go-secure-stdlib/strutil;version=3Dv0.1.2;sha256sum=
=3D8070c67bc97e15488b99b172ddb6631412dca0fcb8cea90e37fe55d95e1af00a
> \
> > +    gomod://
> github.com/hashicorp/go-sockaddr;version=3Dv1.0.7;sha256sum=3D53ea8d77b68=
056fe7f40a53338aa73ed6ddca9558fe1156804070a060f1a930f
> \
> > +    gomod://
> github.com/hashicorp/hcl;version=3Dv1.0.1-vault-7;sha256sum=3D84fea514e70=
253c65e3caf90a8d9f366808bdfb4099914d1e6ab0d1fdba976b7
> \
> > +    gomod://
> github.com/hashicorp/vault/api;version=3Dv1.22.0;sha256sum=3Dca415b5364f4=
9dadb17be1bc60f156c9f5cd6579a2e0711b069b3418c3a2265e
> \
> > +    gomod://
> github.com/in-toto/attestation;version=3Dv1.1.2;sha256sum=3D0bb737ac0836f=
6a9ba6499139630a558bdda510c78dc51967e58355006a03d9a
> \
> > +    gomod://
> github.com/in-toto/in-toto-golang;version=3Dv0.10.0;sha256sum=3D714134f01=
5027dc9d65e55de7625d06ed3f91cc3888a84480a6110e14e952709
> \
> > +    gomod://
> github.com/jedisct1/go-minisign;version=3Dv0.0.0-20230811132847-661be99b8=
267;sha256sum=3D5c8c88dd60cd9c2214a38f5ce42d39c05aafb58a92909c2bc1f49e430d5=
9b1d5
> \
> > +    gomod://
> github.com/jellydator/ttlcache/v3;version=3Dv3.4.0;sha256sum=3Db3f31d5c4e=
a68698f1de6f85dbaacb176b2fadeaa6d426a38f48f4f752f974fb
> \
> > +    gomod://
> github.com/json-iterator/go;version=3Dv1.1.12;sha256sum=3Dd001ea57081afd0=
e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501
> \
> > +    gomod://
> github.com/klauspost/compress;version=3Dv1.18.4;sha256sum=3Da295e4443ad6c=
88d8f5b8690807f413800fa171571d3a5970e2abefe6fe6e990
> \
> > +    gomod://
> github.com/kylelemons/godebug;version=3Dv1.1.0;sha256sum=3Ddbbd0ce8c2f493=
2bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13
> \
> > +    gomod://
> github.com/lestrrat-go/blackmagic;version=3Dv1.0.4;sha256sum=3D4775ca8eab=
443a882cc1772c25716810a889d478746c6a405f559750de42dce6
> \
> > +    gomod://
> github.com/lestrrat-go/dsig;version=3Dv1.0.0;sha256sum=3Dd4f31e5380752d00=
740a447b7c129dfb2644367e4642e35ad60ff252edb470a0
> \
> > +    gomod://
> github.com/lestrrat-go/httpcc;version=3Dv1.0.1;sha256sum=3Dd75132f805ea5c=
f6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c
> \
> > +    gomod://
> github.com/lestrrat-go/httprc/v3;version=3Dv3.0.2;sha256sum=3D188f9e9b9fd=
ebde5fd6196a6cdc1b5a3a0f9b4c9a82cb146cfbb5b600a6a5094
> \
> > +    gomod://
> github.com/lestrrat-go/jwx/v3;version=3Dv3.0.13;sha256sum=3Df1ee98b4f90c7=
9eecfce10e995ecd0a538224e853293814c41ffa13947ad407a
> \
> > +    gomod://
> github.com/lestrrat-go/option/v2;version=3Dv2.0.0;sha256sum=3D3456bd01638=
c67da62570123f3d12f5996d0a01ed521959c2fc85aa83d3ee94a
> \
> > +    gomod://
> github.com/letsencrypt/boulder;version=3Dv0.20260223.0;sha256sum=3Df9a88b=
a61b0c561c2570b9df5e6d788262fbf197d3d90cede64a321fae9a899d
> \
> > +    gomod://
> github.com/mitchellh/go-homedir;version=3Dv1.1.0;sha256sum=3Dfffec361fc7e=
776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184
> \
> > +    gomod://
> github.com/mitchellh/go-wordwrap;version=3Dv1.0.1;sha256sum=3D5f96426c4b3=
b3e90a9b7471568cb1d61d6a306744f5d4765a30fa8a61e1c0b47
> \
> > +    gomod://
> github.com/mitchellh/mapstructure;version=3Dv1.5.1-0.20231216201459-85089=
81c8b6c;sha256sum=3D1cc37cf0bb7849d0fb29daabe5597450c565e334564ed28eabf3f06=
02259733b
> \
> > +    gomod://
> github.com/moby/term;version=3Dv0.5.2;sha256sum=3Df8d6e5c53992c640512ee45=
a9b6147a765bebe3d8d50e3bfe1e4ec3e052cd688
> \
> > +    gomod://
> github.com/modern-go/concurrent;version=3Dv0.0.0-20180306012644-bacd9c7ef=
1dd;sha256sum=3D91ef49599bec459869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4=
a8073
> \
> > +    gomod://
> github.com/modern-go/reflect2;version=3Dv1.0.3-0.20250322232337-35a7c28c3=
1ee;sha256sum=3D49f3fb0f76b1b98b52b5e6e8eab2a48454eab33904b937625941c28138a=
7fea4
> \
> > +    gomod://
> github.com/mozillazg/docker-credential-acr-helper;version=3Dv0.4.0;sha256=
sum=3De696b388bfc8b0a557722ccdcd3c002657daaaaf6aea07349145dc6e42dd463a
> \
> > +    gomod://
> github.com/munnerz/goautoneg;version=3Dv0.0.0-20191010083416-a7dc8b61c822=
;sha256sum=3D3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636af=
d9
> \
> > +    gomod://
> github.com/natefinch/atomic;version=3Dv1.0.1;sha256sum=3D25df4a9727bd8750=
557a848d9066503c2e0b1788821be4db87377fd202254ed4
> \
> > +    gomod://
> github.com/nozzle/throttler;version=3Dv0.0.0-20180817012639-2ea982251481;=
sha256sum=3D660c8605727fc99ef3c71706592138b59cc6cd4d63be978b2371887626499b7=
5
> \
> > +    gomod://
> github.com/oklog/ulid/v2;version=3Dv2.1.1;sha256sum=3D312b5fea3f68df920ad=
affc327440efbaba43ad6a8df2f7e0c9e365743f6ff89
> \
> > +    gomod://
> github.com/oleiade/reflections;version=3Dv1.1.0;sha256sum=3Df8e70604f64ac=
56c843f2b5f7d97546d23a94db198f031c0d23962c4d2b8bce5
> \
> > +    gomod://
> github.com/open-policy-agent/opa;version=3Dv1.14.1;sha256sum=3D6755ebebbd=
9106de9fc4159d3655986c4030e3397168f8cff23f7b3eee6975e1
> \
> > +    gomod://
> github.com/opencontainers/go-digest;version=3Dv1.0.0;sha256sum=3D615efb31=
ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86
> \
> > +    gomod://
> github.com/opencontainers/image-spec;version=3Dv1.1.1;sha256sum=3D3a32eeb=
459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574
> \
> > +    gomod://
> github.com/pborman/uuid;version=3Dv1.2.1;sha256sum=3D3699aef3b9e0a97863a4=
a90bf26254d1a6ba03a2b1d4f4d2a5061c4d29d9dd7f
> \
> > +    gomod://
> github.com/pelletier/go-toml/v2;version=3Dv2.2.4;sha256sum=3D82162be7b850=
77f3be49bfe0f1e01f308b9c9554c72a980a22a34432f94885f0
> \
> > +    gomod://
> github.com/pkg/browser;version=3Dv0.0.0-20240102092130-5ac0b6a4141c;sha25=
6sum=3D8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1
> \
> > +    gomod://
> github.com/pkg/errors;version=3Dv0.9.1;sha256sum=3Dd4c36b8bcd0616290a3913=
215e0f53b931bd6e00670596f2960df1b44af2bd07
> \
> > +    gomod://
> github.com/protocolbuffers/txtpbfmt;version=3Dv0.0.0-20260217160748-a481f=
6a22f94;sha256sum=3De184542ac96a60f21efe61a5f71f1a14636e46449ea3a445108adb2=
47ddbb019
> \
> > +    gomod://
> github.com/rcrowley/go-metrics;version=3Dv0.0.0-20250401214520-65e299d6c5=
c9;sha256sum=3Da8c9e9792ad16f31ef8c32232de6243cc02147175661c9f64bc7b292f1c4=
d0cc
> \
> > +    gomod://
> github.com/rogpeppe/go-internal;version=3Dv1.14.1;sha256sum=3Dab3d18283ce=
f2f46ddfd489b6b14b970eb7dbbb642786f025ee1ac5291dc4e70
> \
> > +    gomod://
> github.com/ryanuber/go-glob;version=3Dv1.0.0;sha256sum=3D2084f36ead38a505=
489fdb46329502fb627f568224dcc22ef11ec173b61fc2cf
> \
> > +    gomod://
> github.com/sagikazarmark/locafero;version=3Dv0.11.0;sha256sum=3D6c2a9bdf9=
567f63caebf47694d94acd4350b1d4d69f13c3188f4e7e82939f6a5
> \
> > +    gomod://
> github.com/sassoftware/relic;version=3Dv7.2.1+incompatible;sha256sum=3Dc2=
8fccce743db96510662f1d45f8a4b2212f5f60fb4a4f31a99261118ed068f3
> \
> > +    gomod://
> github.com/secure-systems-lab/go-securesystemslib;version=3Dv0.10.0;sha25=
6sum=3D399f400aa66b243ebd24215a78041cdb7dd0a47ac74e0068898dcf33428d8bc3
> \
> > +    gomod://
> github.com/shibumi/go-pathspec;version=3Dv1.3.0;sha256sum=3D1ac9091ebe9ff=
4154ddc39b2b3436c5b6b268d5cdc1e8462c9790485cd76a58f
> \
> > +    gomod://
> github.com/sigstore/fulcio;version=3Dv1.8.5;sha256sum=3Dd755a957ed7696502=
16da2e3c2905c45434673b00c4510a563d6620b30a305df
> \
> > +    gomod://
> github.com/sigstore/protobuf-specs;version=3Dv0.5.0;sha256sum=3D0eb8b14e1=
e4392ee93e6ab48fabea3f59d42cdf87e62111384c5d2cc02e1639f
> \
> > +    gomod://
> github.com/sigstore/rekor;version=3Dv1.5.1;sha256sum=3Df3b55a07b7d6f2ce17=
c26d1840a6e0b28875bb5ca28b9fcd3ecd4f3f53be9051
> \
> > +    gomod://
> github.com/sigstore/rekor-tiles/v2;version=3Dv2.2.1;sha256sum=3Dd14bbde50=
827e92ee018c5aa28da7ace0225f6e0f557de01d81241d49ebf9905
> \
> > +    gomod://
> github.com/sigstore/sigstore;version=3Dv1.10.5;sha256sum=3D335a90c44640d2=
0cf6dcf078cc3e540300cbcf4dff634bea2703b2b74d25c1c4
> \
> > +    gomod://
> github.com/sigstore/sigstore/pkg/signature/kms/aws;version=3Dv1.10.5;sha2=
56sum=3D62fb728a5bf10ba130912f43bff29f1ce2ddbe66833092aec4edb39dbf08ee99
> \
> > +    gomod://
> github.com/sigstore/sigstore/pkg/signature/kms/azure;version=3Dv1.10.5;sh=
a256sum=3D7eb73ecc729016cecb9b76f32c0ff39c9a7b3f72c3060fa04e119d303c84c038
> \
> > +    gomod://
> github.com/sigstore/sigstore/pkg/signature/kms/gcp;version=3Dv1.10.5;sha2=
56sum=3Dda6b2511b40125d34d7bf46a94698ef9601a120bd569fca6a6ad4c2b328e0456
> \
> > +    gomod://
> github.com/sigstore/sigstore/pkg/signature/kms/hashivault;version=3Dv1.10=
.5;sha256sum=3D13172983962f0d3fd0d56bee830456cd2c2584b0742d1b8efef14b4641e5=
1956
> \
> > +    gomod://
> github.com/sigstore/sigstore-go;version=3Dv1.1.4;sha256sum=3D809fa597f98f=
cec826efcfdb1ac1376e25903adcccdae356b43b13af10895698
> \
> > +    gomod://
> github.com/sigstore/timestamp-authority/v2;version=3Dv2.0.5;sha256sum=3D6=
1cb8c7c183c7ae5d5bdf145021f5b090f0f43f92e8f69626d0bac1bb6a7155c
> \
> > +    gomod://
> github.com/sirupsen/logrus;version=3Dv1.9.4;sha256sum=3D3847d00c5ee6948f1=
ff0d0120bc343c55ce852becb7720f8f08f53eecfe9e437
> \
> > +    gomod://
> github.com/sourcegraph/conc;version=3Dv0.3.1-0.20240121214520-5f936abd7ae=
8;sha256sum=3D6db56fe285f78ba994a77d676d790b1db85a47cc8948a42d4c2f6ca6200b9=
413
> \
> > +    gomod://
> github.com/spf13/afero;version=3Dv1.15.0;sha256sum=3Dd03a0bbce87eeaa1c23f=
0c0276707bb2d59f46efee875d7d7f1d570201be6e1f
> \
> > +    gomod://
> github.com/spf13/cast;version=3Dv1.10.0;sha256sum=3D7c7ba27f9979ada980c2a=
69f6b2fdf7b4ce1f2b766e245c0a4716f546ad7ddce
> \
> > +    gomod://
> github.com/spf13/cobra;version=3Dv1.10.2;sha256sum=3Da00aae6fcd631e0fde52=
c98604452ff70e1b73c3b8a560d68db15aff5e26872d
> \
> > +    gomod://
> github.com/spf13/pflag;version=3Dv1.0.10;sha256sum=3Da246b8c9d3daa87d6c63=
4cdfee1bdf7fa53d5817eeef4fa0c6da43edd12de4ca
> \
> > +    gomod://
> github.com/spf13/viper;version=3Dv1.21.0;sha256sum=3D4096e4ccdbb74027c49f=
0dfede6d67193053b0d1c1ecce57543cf3dacc7b249e
> \
> > +    gomod://
> github.com/spiffe/go-spiffe/v2;version=3Dv2.6.0;sha256sum=3Db90f378c70e2c=
985f61893ca20bf3e8258bb4f66920af759276d330513d0d7d6
> \
> > +    gomod://
> github.com/subosito/gotenv;version=3Dv1.6.0;sha256sum=3D142db3dd2328e744c=
157e85cf3291d027013b79f92a45984f860fe38bc0f1f8d
> \
> > +    gomod://
> github.com/syndtr/goleveldb;version=3Dv1.0.1-0.20220721030215-126854af5e6=
d;sha256sum=3D68a0e0b2969ac85b591fa083b202852bf0eb8a60b303581a4bd68bc0b69d7=
7d8
> \
> > +    gomod://
> github.com/tchap/go-patricia/v2;version=3Dv2.3.3;sha256sum=3D37591393b0ea=
113849eacbc292886ea6978798a596164510c5834c2edc374067
> \
> > +    gomod://
> github.com/theupdateframework/go-tuf;version=3Dv0.7.0;sha256sum=3D5c2c631=
a720e3c4225cfff085bd080acabd4308d0e4e6244e4cc180e019b8eaa
> \
> > +    gomod://
> github.com/theupdateframework/go-tuf/v2;version=3Dv2.4.1;sha256sum=3D1cb9=
13a4229e1b64c95b08a7866821256833f70ee3e316f7cdf82cc4ddc9267a
> \
> > +    gomod://
> github.com/titanous/rocacheck;version=3Dv0.0.0-20171023193734-afe73141d39=
9;sha256sum=3D00e4f6d7d6a6a424539afb3968c2c9cfd9b42eca089015d67e90358b91e7f=
8da
> \
> > +    gomod://
> github.com/tjfoc/gmsm;version=3Dv1.4.1;sha256sum=3Dba1f3ccf698a62bcb28c59=
4d995f21587021ad759e777aa64367c8a7332cc10b
> \
> > +    gomod://
> github.com/transparency-dev/formats;version=3Dv0.0.0-20251017110053-404c0=
d5b696c;sha256sum=3Dff992fe96b260806864ad3557958852990d2b3d0d7e796887db7a9e=
596613dcc
> \
> > +    gomod://
> github.com/transparency-dev/merkle;version=3Dv0.0.2;sha256sum=3Dbff8072eb=
052d166df4f8f3d144451ca83b98f1c0382995167008c44abc383fd
> \
> > +    gomod://
> github.com/valyala/fastjson;version=3Dv1.6.7;sha256sum=3D4cbfe712a23a581d=
b9b0eb5e1929fb8da82586e90f3d594dc60b508207047b63
> \
> > +    gomod://
> github.com/vbatts/tar-split;version=3Dv0.12.2;sha256sum=3D1f3bcd7cebbe3b6=
7a4e7d5d4226f7127ea11bf652ed3b41cc1a0a24cf15e0dd7
> \
> > +    gomod://
> github.com/vektah/gqlparser/v2;version=3Dv2.5.32;sha256sum=3D9615eb15e094=
a259de740e284370a8cc4524c137491a4a728ab9c350aa5a94d3
> \
> > +    gomod://
> github.com/withfig/autocomplete-tools/integrations/cobra;version=3Dv1.2.1=
;sha256sum=3Db2a47ab2313e49e37073c93dec8d010dc9a44a846a08d87133e574cb9fad10=
f6
> \
> > +    gomod://
> github.com/x448/float16;version=3Dv0.8.4;sha256sum=3D73b24a41037ea999ab66=
851e3798a0973dbb1f214925915b01f0820f7b2f1500
> \
> > +    gomod://
> github.com/xeipuuv/gojsonpointer;version=3Dv0.0.0-20190905194746-02993c40=
7bfb;sha256sum=3D11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aa=
f228de
> \
> > +    gomod://
> github.com/xeipuuv/gojsonreference;version=3Dv0.0.0-20180127040603-bd5ef7=
bd5415;sha256sum=3D7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c9=
9f7e45e7
> \
> > +    gomod://
> github.com/yashtewari/glob-intersection;version=3Dv0.2.0;sha256sum=3Dbc99=
9bc9a3bcce0ed7c06180320d2236a5c32aa61def5a7c79963faa6bcf2fd0
> \
> > +    gomod://
> gitlab.com/gitlab-org/api/client-go;version=3Dv1.46.0;sha256sum=3D42ad7a4=
1d100fbcc5851b4df478f45856a7a6da5bc4706ec0e511e287d676049
> \
> > +    gomod://
> go.opentelemetry.io/auto/sdk;version=3Dv1.2.1;sha256sum=3Da08a16fc0a7041c=
db875f47a260a56000632212c85f65a302a043c76380c8335
> \
> > +    gomod://
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc;version=3Dv0.63.0;sha256sum=3Da093449439c5be2ecaa0c25a4690281445954876a8=
d4f3396e6d27561d5479dc
> \
> > +    gomod://
> go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp;version=3Dv=
0.65.0;sha256sum=3Df68a6e3f8f93b5857390583f3e855801ce93244ea18bf56ab45c221a=
4ea32a4c
> \
> > +    gomod://
> go.opentelemetry.io/otel;version=3Dv1.41.0;sha256sum=3D1a624187c6ed53704d=
278e4cf12c143e1046ba1e894b8ea470cb309d31adf742
> \
> > +    gomod://
> go.opentelemetry.io/otel/metric;version=3Dv1.41.0;sha256sum=3Dee6cd9515bf=
f605dc265e36f60d7ca293ce920688906ef8baef5d016474f2c2f
> \
> > +    gomod://
> go.opentelemetry.io/otel/trace;version=3Dv1.41.0;sha256sum=3D6376f3811964=
7b709e49bd13585722a685578fb4e4cdaa46ed421a3832a2fa9e
> \
> > +    gomod://
> go.uber.org/multierr;version=3Dv1.11.0;sha256sum=3D2249b5d2fdce61f6ee661a=
679d8552599af084a761cbbc871da77641bddce0c3
> \
> > +    gomod://
> go.uber.org/zap;version=3Dv1.27.1;sha256sum=3D38760227142d38369069374c005=
707bc6b3c270a75f34fa3f17c48c863143cdc
> \
> > +    gomod://
> go.yaml.in/yaml/v2;version=3Dv2.4.3;sha256sum=3Dbacc1ac9ed600be2df58f88b8=
8d5c1b6f6473526fa4069f61549f64b81b09f41
> \
> > +    gomod://
> go.yaml.in/yaml/v3;version=3Dv3.0.4;sha256sum=3D0317dae56eaa9e9954467c876=
8fd6a89ba2005f1534e2c26fce5163ad8d2ef31
> \
> > +    gomod://
> golang.org/x/crypto;version=3Dv0.49.0;sha256sum=3Dcbca45d1fcb0fa359cd232b=
884ba86cfa1a32644ff7efdeb79807db3eb0f005d
> \
> > +    gomod://
> golang.org/x/mod;version=3Dv0.34.0;sha256sum=3D8e6b8d8a771dac070d44c8c701=
b1fba4c3565031f4f7170e6fed9d3022b4aa32
> \
> > +    gomod://
> golang.org/x/net;version=3Dv0.52.0;sha256sum=3D5b8bf13a81552cd4ffc06dae2b=
78fb1e72ece57e54446e396ff9c19251e917ed
> \
> > +    gomod://
> golang.org/x/oauth2;version=3Dv0.36.0;sha256sum=3D15bf65ff103e5dafc809d78=
cd037a1d1e88ccb8451824e851156002a13304504
> \
> > +    gomod://
> golang.org/x/sync;version=3Dv0.20.0;sha256sum=3D7179d4d68800f6fdcadb9d4bb=
f11cbb5df9b40360c89305c203fe20723cbd375
> \
> > +    gomod://
> golang.org/x/sys;version=3Dv0.42.0;sha256sum=3D99df0ad90183debc80aee0b748=
9648574c6baa0c1cf5da37aaf591cf2e2d426a
> \
> > +    gomod://
> golang.org/x/term;version=3Dv0.41.0;sha256sum=3D91ca75a3f454d5ddede1f58c3=
e4fc8e169c6f3c037223ac0ac76e78234d22828
> \
> > +    gomod://
> golang.org/x/text;version=3Dv0.35.0;sha256sum=3D2df36ee135211552d1e729d2a=
2a4b5bbff2bd3a0cc53064151a6e6495e947b32
> \
> > +    gomod://
> golang.org/x/time;version=3Dv0.15.0;sha256sum=3D8cfb20e915fa5d6c3fd264304=
233f8d71a3385e48a37819239c532ad9da27f84
> \
> > +    gomod://
> google.golang.org/api;version=3Dv0.269.0;sha256sum=3D226e867540ec7a664a17=
97f3db25674e3637796cd4b30784bbdcbe49a810367d
> \
> > +    gomod://
> google.golang.org/genproto;version=3Dv0.0.0-20260128011058-8636f8732409;s=
ha256sum=3D88202f77c2801a95607cfa545c68454acdd06a0ec4e5e3269a75baa67d1b82ad
> \
> > +    gomod://
> google.golang.org/genproto/googleapis/api;version=3Dv0.0.0-20260203192932=
-546029d2fa20;sha256sum=3D6d03a2d9b364a1fc786170236268b402a8500e5c4442b3762=
989cf0d5729cfaa
> \
> > +    gomod://
> google.golang.org/genproto/googleapis/rpc;version=3Dv0.0.0-20260217215200=
-42d3e9bedb6d;sha256sum=3Dd86506b997ea20d69bc8287de38c76b6dea4664d2c543d2ec=
f545cd7e932fcd8
> \
> > +    gomod://
> google.golang.org/grpc;version=3Dv1.80.0;sha256sum=3D12b91cdce1bbcd837193=
ef71c42a09b454bff644e0ddab389a396328c2e41779
> \
> > +    gomod://
> google.golang.org/protobuf;version=3Dv1.36.11;sha256sum=3D14983d36c56a814=
ed91b6d652f2b8f895baba1b84eb43b28a0b132c8637cd274
> \
> > +    gomod://
> gopkg.in/evanphx/json-patch.v4;version=3Dv4.13.0;sha256sum=3Dde94747c5023=
a2c83909845c76acc6b4bfe28b44994207394b5e057f3085625a
> \
> > +    gomod://
> gopkg.in/inf.v0;version=3Dv0.9.1;sha256sum=3D08abac18c95cc43b725d4925f633=
09398d618beab68b4669659b61255e5374a0
> \
> > +    gomod://
> gopkg.in/ini.v1;version=3Dv1.67.1;sha256sum=3D9af5f66337e725f2ec19d23eff4=
f72e1b14c67b4b0c80b0677a3a2c0944cf09c
> \
> > +    gomod://
> gopkg.in/yaml.v3;version=3Dv3.0.1;sha256sum=3Daab8fbc4e6300ea08e6afe1caea=
18a21c90c79f489f52c53e2f20431f1a9a015
> \
> > +    gomod://
> k8s.io/api;version=3Dv0.35.3;sha256sum=3Dacc83efef5e4469b0c89e01f62602aed=
4c285cae5cb4bc2ee0a3fe51baf9e16b
> \
> > +    gomod://
> k8s.io/apimachinery;version=3Dv0.35.3;sha256sum=3Dfba136ace873c2c91b81b7b=
e38e11fa74c74dde9526d3f1e22c13c09e648da6d
> \
> > +    gomod://
> k8s.io/client-go;version=3Dv0.35.3;sha256sum=3Deda662eefedead2394dc545b00=
d2be3e5c5d645cdd9a7c9331b4eeab94fe823b
> \
> > +    gomod://
> k8s.io/klog/v2;version=3Dv2.130.1;sha256sum=3D262b961175bbe8cf6ecf227d063=
03df2eb47bfb890e19d516846422f7d406cb9
> \
> > +    gomod://
> k8s.io/kube-openapi;version=3Dv0.0.0-20250910181357-589584f1c912;sha256su=
m=3Dc8f5db9fcfdcee9ae6057c0c0a2ea1232f0cf27a07d857517c7ad1e38d9950bc
> \
> > +    gomod://
> k8s.io/utils;version=3Dv0.0.0-20251002143259-bc988d571ff4;sha256sum=3D3ca=
ff8384915ba747aad7708cf2a4aaa2501f952780e64049abe981a57d1cb49
> \
> > +    gomod://
> sigs.k8s.io/json;version=3Dv0.0.0-20250730193827-2d320260d730;sha256sum=
=3D7cec6eae3e4e4c9c1e0a009eef200740990fafbcb9cab081eb18ce32f6e7a7b9
> \
> > +    gomod://
> sigs.k8s.io/randfill;version=3Dv1.0.0;sha256sum=3D31dbbfc44ce12f78f1b68d6=
bbeed8526aa73c53243353d44d50b2532c828f5f1
> \
> > +    gomod://
> sigs.k8s.io/release-utils;version=3Dv0.12.4;sha256sum=3D1bf5824c8978e3b1d=
3ae83a01facae97c994c2eea6982e15050d9291a19558b1
> \
> > +    gomod://
> sigs.k8s.io/structured-merge-diff/v6;version=3Dv6.3.0;sha256sum=3Dbcb0e66=
2e31cfbd06b4cb52eb59eef6f0da101bce5aedca7dbce1f78c34d637a
> \
> > +    gomod://
> sigs.k8s.io/yaml;version=3Dv1.6.0;sha256sum=3Dcf88648a471581817b00a42ee8d=
24fd73eb0e3503998cf46d8e63787e11e5052
> \
> > +"
> > diff --git a/recipes-containers/cosign/cosign-licenses.inc
> b/recipes-containers/cosign/cosign-licenses.inc
> > new file mode 100644
> > index 00000000..4e39c6c9
> > --- /dev/null
> > +++ b/recipes-containers/cosign/cosign-licenses.inc
> > @@ -0,0 +1,274 @@
> > +
> > +# This file has been generated by go-mod-update-modules.bbclass
> > +#
> > +# Do not modify it by hand, as the contents will be replaced when
> > +# running the update-modules task.
> > +
> > +LICENSE +=3D "& Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT &
> MPL-2.0"
> > +
> > +LIC_FILES_CHKSUM +=3D "\
> > +    file://pkg/mod/
> cloud.google.com/go/auth/oauth2adapt@v0.2.8/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cloud.google.com/go/auth@v0.18.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cloud.google.com/go/compute/metadata@v0.9.0/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cloud.google.com/go/iam@v1.5.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cloud.google.com/go/kms@v1.26.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cloud.google.com/go/longrunning@v0.8.0/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cuelabs.dev/go/oci/ociregistry@v0.0.0-20251212221603-3adeb8663819/LICENSE=
;md5=3D175792518e4ac015ab6696d16c4f607e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> cuelang.org/go@v0.16.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spd=
x=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!aliyun!container!service/ack-ram-tool/pkg/credentials/provide=
r@v0.14.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure!a!d/microsoft-authentication-library-for-go@v1.6.0/LICE=
NSE;md5=3De74f78882cab57fd1cc4c5482b9a214a;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go/sdk/azcore@v1.21.0/LICENSE.txt;md5=3Da=
93cb0863fda8e7f177e09f6943951b4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go/sdk/azidentity@v1.13.1/LICENSE.txt;md5=
=3Da93cb0863fda8e7f177e09f6943951b4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go/sdk/internal@v1.11.2/LICENSE.txt;md5=
=3Da93cb0863fda8e7f177e09f6943951b4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go/sdk/security/keyvault/azkeys@v1.4.0/LI=
CENSE.txt;md5=3D261d8686a7cf1ce9570cdc99746659f8;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go/sdk/security/keyvault/internal@v1.2.0/=
LICENSE.txt;md5=3D261d8686a7cf1ce9570cdc99746659f8;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/azure-sdk-for-go@v68.0.0+incompatible/LICENSE.txt;md5=
=3D4f7454c9bcbb0acee6d9a971001befe2;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/autorest/adal@v0.9.23/LICENSE;md5=3Da250e5a=
c3848f2acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/autorest/azure/auth@v0.5.12/LICENSE;md5=3Da=
250e5ac3848f2acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/autorest/azure/cli@v0.4.6/LICENSE;md5=3Da25=
0e5ac3848f2acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/autorest/date@v0.3.0/LICENSE;md5=3Da250e5ac=
3848f2acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/autorest@v0.11.29/LICENSE;md5=3Da250e5ac384=
8f2acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/logger@v0.2.1/LICENSE;md5=3Da250e5ac3848f2a=
cadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/!azure/go-autorest/tracing@v0.6.0/LICENSE;md5=3Da250e5ac3848f2=
acadb5adcb9555c18b;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/agnivade/levenshtein@v1.2.1/License.txt;md5=3D911630ea868cb9d6=
ca549532110fd8fd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/alibabacloud-gateway-spi@v0.0.4/LICENSE;md5=3D=
815228b833e1826a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/cr-20181201@v1.0.10/LICENSE;md5=3D815228b833e1=
826a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/darabonba-openapi@v0.2.1/LICENSE;md5=3D815228b=
833e1826a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/debug@v1.0.0/LICENSE;md5=3D86d3f3a95c324c9479b=
d8986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/endpoint-util@v1.1.1/LICENSE;md5=3D815228b833e=
1826a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/openapi-util@v0.1.0/LICENSE;md5=3D815228b833e1=
826a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/tea-utils@v1.4.5/LICENSE;md5=3D815228b833e1826=
a08c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/tea-xml@v1.1.3/LICENSE;md5=3D815228b833e1826a0=
8c7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/alibabacloud-go/tea@v1.2.1/LICENSE;md5=3D815228b833e1826a08c7c=
ef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aliyun/credentials-go@v1.3.2/LICENSE;md5=3D815228b833e1826a08c=
7cef5b6f00363;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/asaskevich/govalidator@v0.0.0-20230301143203-a9d515a09cc2/LICE=
NSE;md5=3D44f42f71b1145516f11eb20da85d7344;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/config@v1.32.10/LICENSE.txt;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/credentials@v1.19.10/LICENSE.txt;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.18/LICENSE.txt;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.18/LICENSE.txt;m=
d5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.18/LICENSE.txt;md=
5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/internal/ini@v1.8.4/LICENSE.txt;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/ecr@v1.55.3/LICENSE.txt;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/ecrpublic@v1.38.10/LICENSE.txt;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.5/LIC=
ENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.18/LICE=
NSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/kms@v1.50.1/LICENSE.txt;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/signin@v1.0.6/LICENSE.txt;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/sso@v1.30.11/LICENSE.txt;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.35.15/LICENSE.txt;md5=3D3=
b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2/service/sts@v1.41.7/LICENSE.txt;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2@v1.41.2/LICENSE.txt;md5=3D3b83ef96387f14655f=
c854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/aws-sdk-go-v2@v1.41.2/internal/sync/singleflight/LICENSE;m=
d5=3Dbdc234595bc2fe370918f5de5077c8e9;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/aws/smithy-go@v1.24.1/LICENSE;md5=3D34400b68072d710fecd0a2940a=
0d1658;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/aws/smithy-go@v1.24.1/internal/sync/singleflight/LICENSE;md5=
=3Dbdc234595bc2fe370918f5de5077c8e9;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/awslabs/amazon-ecr-credential-helper/ecr-login@v0.12.0/LICENSE=
;md5=3De60493c23a6358c3e44f125a289c0692;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/blang/semver@v3.5.1+incompatible/LICENSE;md5=3D5a3ade42a900439=
691ebc22013660cae;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/buildkite/agent/v3@v3.118.0/LICENSE.txt;md5=3D56f76a415afa1476=
c8632f1944a0e0bd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/buildkite/go-pipeline@v0.16.0/LICENSE;md5=3De5997726ed2708dfa4=
19572da9dbadaa;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/buildkite/interpolate@v0.1.5/LICENSE.txt;md5=3D5d73adf54d93c6c=
9f4a0a6f136cfec4f;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/buildkite/roko@v1.4.0/LICENSE.md;md5=3D6926b41f021e7ddd23997af=
e97615111;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/cenkalti/backoff/v4@v4.3.0/LICENSE;md5=3D1571d94433e3f3aa05267=
efd4dbea68b;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/cenkalti/backoff/v5@v5.0.3/LICENSE;md5=3D1571d94433e3f3aa05267=
efd4dbea68b;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/cespare/xxhash/v2@v2.3.0/LICENSE.txt;md5=3D802da049c92a99b4387=
d3f3d91b00fa9;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/chrismellard/docker-credential-acr-env@v0.0.0-20230304212654-8=
2a0ddb27589/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.=
0
> \
> > +    file://pkg/mod/
> github.com/clbanning/mxj/v2@v2.7.0/LICENSE;md5=3Db95d77640f09a1f26a370172=
88284f35;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/cockroachdb/apd/v3@v3.2.1/LICENSE;md5=3D91fa97a925e58262605528=
603a297ccd;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/common-nighthawk/go-figure@v0.0.0-20210622060536-734e95fb86be/=
LICENSE;md5=3Df37e5ec1bc71f8242927b328878a744d;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/containerd/stargz-snapshotter/estargz@v0.18.2/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/coreos/go-oidc/v3@v3.17.0/LICENSE;md5=3Dd2794c0df5b907fdace235=
a619d80314;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/cyberphone/json-canonicalization@v0.0.0-20241213102144-19d51d7=
fe467/LICENSE;md5=3D84f589d883da07bef20c745c96b1019c;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/davecgh/go-spew@v1.1.2-0.20180830191138-d8f796af33cc/LICENSE;m=
d5=3Dc06795ed54b2a35ebeeb543cd3a73e56;spdx=3DISC
> \
> > +    file://pkg/mod/
> github.com/digitorus/pkcs7@v0.0.0-20230818184609-3a137a874352/LICENSE;md5=
=3Da9b2952d51b44eae97b6090117f60792;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/digitorus/timestamp@v0.0.0-20231217203849-220c5c2851b7/LICENSE=
;md5=3Dee17b041b11533700fde49eee80a1553;spdx=3DBSD-2-Clause
> \
> > +    file://pkg/mod/
> github.com/dimchansky/utfbom@v1.1.1/LICENSE;md5=3Dd5b81a403268b5ea485b4a2=
579630c17;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/docker/cli@v29.3.0+incompatible/LICENSE;md5=3D9740d093a080530b=
5c5c6573df9af45a;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/docker/distribution@v2.8.3+incompatible/LICENSE;md5=3Dd2794c0d=
f5b907fdace235a619d80314;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/docker/docker-credential-helpers@v0.9.5/LICENSE;md5=3D5f28a5a1=
5a6bde800864f444aee95768;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/dustin/go-humanize@v1.0.1/LICENSE;md5=3D8c6127b79304a5e0a5756d=
03c7a58766;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/emicklei/go-restful/v3@v3.13.0/LICENSE;md5=3D2ebc1c12a0f4eae53=
94522e31961e1de;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/emicklei/proto@v1.14.3/LICENSE;md5=3Db1ce415d97e837c8677d332b2=
74d4f0b;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=3D684da2bf3eed8fc8860=
e75ad84638225;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/fsnotify/fsnotify@v1.9.0/LICENSE;md5=3D8bae8b116e2cfd723492b02=
d9a212fe2;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/fxamacker/cbor/v2@v2.9.0/LICENSE;md5=3D827f5a2fa861382d35a3943=
adf9ebb86;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/go-chi/chi/v5@v5.2.5/LICENSE;md5=3Deef59fdf1c5117072cbf52b79c6=
ea691;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/go-jose/go-jose/v4@v4.1.4/LICENSE;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-jose/go-jose/v4@v4.1.4/json/LICENSE;md5=3D591778525c869cdde=
0ab5a1bf283cd81;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/go-logr/logr@v1.4.3/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20=
c29e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-logr/stdr@v1.2.2/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f=
4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/analysis@v0.24.3/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/errors@v0.22.7/LICENSE;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/jsonpointer@v0.22.5/LICENSE;md5=3D86d3f3a95c324c947=
9bd8986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/jsonreference@v0.21.5/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/loads@v0.23.3/LICENSE;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/runtime@v0.29.3/LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/runtime@v0.29.3/middleware/denco/LICENSE;md5=3D9191=
b4cb03404322c952b5e2a69c0914;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/go-openapi/spec@v0.22.4/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/strfmt@v0.26.0/LICENSE;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/cmdutils@v0.25.5/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/conv@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/fileutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/jsonname@v0.25.5/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/jsonutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/loading@v0.25.5/LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/mangling@v0.25.5/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/netutils@v0.25.5/LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/stringutils@v0.25.5/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/typeutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag/yamlutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/swag@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-openapi/validate@v0.25.2/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/go-viper/mapstructure/v2@v2.5.0/LICENSE;md5=3D3f7765c3d4f58e1f=
84c4313cecf0f5bd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/gobwas/glob@v0.2.3/LICENSE;md5=3D0945febef83436030e30c73ea9980=
b42;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/golang/snappy@v0.0.4/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f=
9aac6;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/golang-jwt/jwt/v4@v4.5.2/LICENSE;md5=3Da21b708d8b320c68979c44a=
c9dba9b0d;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/golang-jwt/jwt/v5@v5.3.0/LICENSE;md5=3Da21b708d8b320c68979c44a=
c9dba9b0d;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/google/certificate-transparency-go@v1.3.3/LICENSE;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/google/gnostic-models@v0.7.0/LICENSE;md5=3Db1e01b26bacfc223204=
6c90a330332b3;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/google/go-cmp@v0.7.0/LICENSE;md5=3D4ac66f7dea41d8d116cb7fb28ae=
ff2ab;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/google/go-containerregistry@v0.21.3/LICENSE;md5=3D175792518e4a=
c015ab6696d16c4f607e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/google/go-github/v73@v73.0.0/LICENSE;md5=3D44714fe40638e49453c=
fb438ddd301f1;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/google/go-querystring@v1.2.0/LICENSE;md5=3D29f156828ca5f2df0d1=
c12543a75f12a;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/google/s2a-go@v0.1.9/LICENSE.md;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/google/uuid@v1.6.0/LICENSE;md5=3D88073b6dd8ec00fe09da59e0b6dfd=
ed1;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/googleapis/enterprise-certificate-proxy@v0.3.12/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/googleapis/gax-go/v2@v2.17.0/LICENSE;md5=3D0dd48ae8103725bd7b4=
01261520cdfbb;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/grpc-ecosystem/grpc-gateway/v2@v2.27.7/LICENSE;md5=3Dc510a2a01=
572b82d27f28fd4d02ca318;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/hashicorp/errwrap@v1.1.0/LICENSE;md5=3Db278a92d2c1509760384428=
817710378;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-cleanhttp@v0.5.2/LICENSE;md5=3D65d26fcc2f35ea6a18=
1ac777e42db1ea;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-multierror@v1.1.1/LICENSE;md5=3Dd44fdeb607e2d2614=
db9464dbedd4094;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-retryablehttp@v0.7.8/LICENSE;md5=3Dbffc21c92b5f3a=
dcbbb06f8e0067e786;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-rootcerts@v1.0.2/LICENSE;md5=3D65d26fcc2f35ea6a18=
1ac777e42db1ea;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-secure-stdlib/parseutil@v0.2.0/LICENSE;md5=3D2925=
e7910462fe55fcd3a652c4cf2a2d;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-secure-stdlib/strutil@v0.1.2/LICENSE;md5=3D65d26f=
cc2f35ea6a181ac777e42db1ea;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/go-sockaddr@v1.0.7/LICENSE;md5=3D384a9beb4b0f73244fc=
e13683da4c7da;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/hcl@v1.0.1-vault-7/LICENSE;md5=3Db278a92d2c150976038=
4428817710378;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/hashicorp/vault/api@v1.22.0/LICENSE;md5=3Dbffc21c92b5f3adcbbb0=
6f8e0067e786;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/in-toto/attestation@v1.1.2/LICENSE;md5=3D1a161be702d6505e54009=
7b42efb3a26;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/in-toto/in-toto-golang@v0.10.0/LICENSE;md5=3D7f23e46c93f32afcb=
729ca6c74f2ecfd;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/jedisct1/go-minisign@v0.0.0-20230811132847-661be99b8267/LICENS=
E;md5=3D0acd1ff194e0fd026c420d1b1396bdfb;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/jellydator/ttlcache/v3@v3.4.0/LICENSE;md5=3D4cea77626c625d583c=
98a85a8658f9d2;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/json-iterator/go@v1.1.12/LICENSE;md5=3D0b69744b481d72d30dbf69f=
84a451cfd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/klauspost/compress@v1.18.4/LICENSE;md5=3Dd0fd9ebda39468b51ff45=
39c9fbb13a8;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/klauspost/compress@v1.18.4/internal/snapref/LICENSE;md5=3Db8b7=
9c7d4cda128290b98c6a21f9aac6;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/klauspost/compress@v1.18.4/zstd/internal/xxhash/LICENSE.txt;md=
5=3D802da049c92a99b4387d3f3d91b00fa9;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/kylelemons/godebug@v1.1.0/LICENSE;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/blackmagic@v1.0.4/LICENSE;md5=3D8144a188cc06dee370=
74f74ffc17c90e;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/dsig@v1.0.0/LICENSE;md5=3D9badcf00edde83118bdbae8e=
de880e37;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/httpcc@v1.0.1/LICENSE;md5=3Dc1d03a9175ab48d85c699b=
2eb51ae56e;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/httprc/v3@v3.0.2/LICENSE;md5=3Db32dcc545c67b6bd57b=
30b946ad44e0b;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/jwx/v3@v3.0.13/LICENSE;md5=3Dc94689f9bcf3eb6a81ad8=
f45767d5be3;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/lestrrat-go/option/v2@v2.0.0/LICENSE;md5=3D8144a188cc06dee3707=
4f74ffc17c90e;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/letsencrypt/boulder@v0.20260223.0/LICENSE.txt;md5=3Db4cdc46805=
5cdcf98982fc01770a84ad;spdx=3DMPL-2.0
> \
> > +    file://pkg/mod/
> github.com/mitchellh/go-homedir@v1.1.0/LICENSE;md5=3D3f7765c3d4f58e1f84c4=
313cecf0f5bd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/mitchellh/go-wordwrap@v1.0.1/LICENSE.md;md5=3D56da355a12d4821c=
da57b8f23ec34bc4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/mitchellh/mapstructure@v1.5.1-0.20231216201459-8508981c8b6c/LI=
CENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/moby/term@v0.5.2/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f2=
8;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/modern-go/concurrent@v0.0.0-20180306012644-bacd9c7ef1dd/LICENS=
E;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/modern-go/reflect2@v1.0.3-0.20250322232337-35a7c28c31ee/LICENS=
E;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/mozillazg/docker-credential-acr-helper@v0.4.0/LICENSE;md5=3Dc0=
b137aa60bc4d0c1f728a404e4c69fe;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/munnerz/goautoneg@v0.0.0-20191010083416-a7dc8b61c822/LICENSE;m=
d5=3D0c241922fc69330e2e5590de114f3bf5;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/natefinch/atomic@v1.0.1/LICENSE;md5=3D18434e48fe4af02ba5f6e67f=
4b56f5f7;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/nozzle/throttler@v0.0.0-20180817012639-2ea982251481/LICENSE;md=
5=3Dd2794c0df5b907fdace235a619d80314;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/oklog/ulid/v2@v2.1.1/LICENSE;md5=3D86d3f3a95c324c9479bd8986968=
f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/oleiade/reflections@v1.1.0/LICENSE;md5=3D545647f4ac07f51f9c469=
92f3bcf342a;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/open-policy-agent/opa@v1.14.1/LICENSE;md5=3Dfa818a259cbed7ce8b=
c2a22d35a464fc;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/open-policy-agent/opa@v1.14.1/internal/edittree/bitvector/lice=
nse.txt;md5=3D328867a460a981563d295f343199aad5;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/open-policy-agent/opa@v1.14.1/internal/gojsonschema/LICENSE-AP=
ACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/open-policy-agent/opa@v1.14.1/internal/semver/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/opencontainers/go-digest@v1.0.0/LICENSE;md5=3D2d6fc0e85c3f118a=
f64c85a78d56d3cf;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/opencontainers/image-spec@v1.1.1/LICENSE;md5=3D27ef03aa2da6e42=
4307f102e8b42621d;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/pborman/uuid@v1.2.1/LICENSE;md5=3D88073b6dd8ec00fe09da59e0b6df=
ded1;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/pelletier/go-toml/v2@v2.2.4/LICENSE;md5=3D390892c6562af0d807e5=
27b06d635f94;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/pkg/browser@v0.0.0-20240102092130-5ac0b6a4141c/LICENSE;md5=3D2=
c6b03e6a9b13bd75b50a8dbeed074da;spdx=3DBSD-2-Clause
> \
> > +    file://pkg/mod/
> github.com/pkg/errors@v0.9.1/LICENSE;md5=3D6fe682a02df52c6653f33bd0f7126b=
5a;spdx=3DBSD-2-Clause
> \
> > +    file://pkg/mod/
> github.com/protocolbuffers/txtpbfmt@v0.0.0-20260217160748-a481f6a22f94/LI=
CENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/rcrowley/go-metrics@v0.0.0-20250401214520-65e299d6c5c9/LICENSE=
;md5=3D1bdf5d819f50f141366dabce3be1460f;spdx=3DBSD-2-Clause
> \
> > +    file://pkg/mod/
> github.com/rogpeppe/go-internal@v1.14.1/LICENSE;md5=3D02d4002e9171d41a8fa=
d93aa7faf3956;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/ryanuber/go-glob@v1.0.0/LICENSE;md5=3Dd2c81b3028eb947731a58fb0=
68c7dff4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/sagikazarmark/locafero@v0.11.0/LICENSE;md5=3D6e63b3f726f4acaf0=
ce766e25bcdaf04;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/sassoftware/relic@v7.2.1+incompatible/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/secure-systems-lab/go-securesystemslib@v0.10.0/LICENSE;md5=3De=
9db53a054cb216b86f5212531da6b23;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/shibumi/go-pathspec@v1.3.0/GO-LICENSE;md5=3D591778525c869cdde0=
ab5a1bf283cd81;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/sigstore/fulcio@v1.8.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01=
bfa2e4042dd46;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/protobuf-specs@v0.5.0/COPYRIGHT.txt;md5=3D79a0324a945=
372989ac53fa7813090a6;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/rekor-tiles/v2@v2.2.1/COPYRIGHT.txt;md5=3Db52278561f2=
843315ac5021b4be699f5;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/rekor@v1.5.1/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01b=
fa2e4042dd46;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore/pkg/signature/kms/aws@v1.10.5/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore/pkg/signature/kms/azure@v1.10.5/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore/pkg/signature/kms/gcp@v1.10.5/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore/pkg/signature/kms/hashivault@v1.10.5/LICENSE=
;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore-go@v1.1.4/COPYRIGHT.txt;md5=3D14403c66e6b22b=
ac895a90b237ba9da0;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/sigstore@v1.10.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30b=
e01bfa2e4042dd46;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sigstore/timestamp-authority/v2@v2.0.5/COPYRIGHT.txt;md5=3Db65=
8629ef1355c5c14f859e623e33da3;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/sirupsen/logrus@v1.9.4/LICENSE;md5=3D8dadfef729c08ec4e631c4f6f=
c5d43a0;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/sourcegraph/conc@v0.3.1-0.20240121214520-5f936abd7ae8/LICENSE;=
md5=3Dc001385e94f81477d77ffaf4321c647d;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/spf13/afero@v1.15.0/LICENSE.txt;md5=3D920d76114a32b0fb75b3f271=
8c5a91be;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/spf13/cast@v1.10.0/LICENSE;md5=3D67fac7567cbf6ba946e5576d590b1=
ed4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/spf13/cobra@v1.10.2/LICENSE.txt;md5=3D920d76114a32b0fb75b3f271=
8c5a91be;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/spf13/pflag@v1.0.10/LICENSE;md5=3D1e8b7dc8b906737639131047a590=
f21d;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/spf13/viper@v1.21.0/LICENSE;md5=3D67fac7567cbf6ba946e5576d590b=
1ed4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/spiffe/go-spiffe/v2@v2.6.0/LICENSE;md5=3D86d3f3a95c324c9479bd8=
986968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/subosito/gotenv@v1.6.0/LICENSE;md5=3D0873257f40b8747d351ccc428=
8d06a40;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/syndtr/goleveldb@v1.0.1-0.20220721030215-126854af5e6d/LICENSE;=
md5=3D6b6b03a3c410317c558abe499de9b5a7;spdx=3DBSD-2-Clause
> \
> > +    file://pkg/mod/
> github.com/tchap/go-patricia/v2@v2.3.3/LICENSE;md5=3D9949b99212edd6b1e24c=
e702376c3baf;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/theupdateframework/go-tuf/v2@v2.4.1/LICENSE;md5=3D7da0b6aed5e1=
7caf37a82737f6ea8bae;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/theupdateframework/go-tuf@v0.7.0/LICENSE;md5=3Dda2aa24617ab5e8=
2d2256f542bd06903;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/titanous/rocacheck@v0.0.0-20171023193734-afe73141d399/LICENSE;=
md5=3D6466139830f9cc7a388f07b29b2c65ce;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/tjfoc/gmsm@v1.4.1/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c2=
9e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/transparency-dev/formats@v0.0.0-20251017110053-404c0d5b696c/LI=
CENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/transparency-dev/merkle@v0.0.2/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/valyala/fastjson@v1.6.7/LICENSE;md5=3D7780bf961575e8d21fbfb56f=
09632be7;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/vbatts/tar-split@v0.12.2/LICENSE;md5=3D19cd0ecd0a6c26052aec628=
b72e72881;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> github.com/vektah/gqlparser/v2@v2.5.32/LICENSE;md5=3De2f8bb50fb8654dc33b3=
6e08a6c85219;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/withfig/autocomplete-tools/integrations/cobra@v1.2.1/LICENSE;m=
d5=3D6f8b2298f7dd18005cae2ec735eba325;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/x448/float16@v0.8.4/LICENSE;md5=3Dde8f8e025d57fe7ee0b67f30d571=
323b;spdx=3DMIT
> \
> > +    file://pkg/mod/
> github.com/xeipuuv/gojsonpointer@v0.0.0-20190905194746-02993c407bfb/LICEN=
SE-APACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> github.com/xeipuuv/gojsonreference@v0.0.0-20180127040603-bd5ef7bd5415/LIC=
ENSE-APACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.=
0
> \
> > +    file://pkg/mod/
> github.com/yashtewari/glob-intersection@v0.2.0/LICENSE;md5=3De3fc50a88d0a=
364313df4b21ef20c29e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> gitlab.com/gitlab-org/api/client-go@v1.46.0/LICENSE;md5=3De3fc50a88d0a364=
313df4b21ef20c29e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/auto/sdk@v1.2.1/LICENSE;md5=3D86d3f3a95c324c9479bd898=
6968f4327;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc@v0.63.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.65.0/LIC=
ENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/otel/metric@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390af=
c8ab967bfefa7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/otel/trace@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc=
8ab967bfefa7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.opentelemetry.io/otel@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967=
bfefa7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.uber.org/multierr@v1.11.0/LICENSE.txt;md5=3D721ac51ede11efb667ff53a866=
be23c4;spdx=3DMIT
> \
> > +    file://pkg/mod/
> go.uber.org/zap@v1.27.1/LICENSE;md5=3Da48e22dd4170c1eb095a423a50302852;sp=
dx=3DMIT
> \
> > +    file://pkg/mod/
> go.yaml.in/yaml/v2@v2.4.3/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;=
spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> go.yaml.in/yaml/v3@v3.0.4/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c;=
spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> golang.org/x/crypto@v0.49.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272=
a;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/mod@v0.34.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;s=
pdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/net@v0.52.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;s=
pdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/oauth2@v0.36.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272=
a;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/sync@v0.20.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;=
spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/sys@v0.42.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;s=
pdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/term@v0.41.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;=
spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/text@v0.35.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;=
spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> golang.org/x/time@v0.15.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;=
spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> google.golang.org/api@v0.269.0/LICENSE;md5=3Da651bb3d8b1c412632e28823bb43=
2b40;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> google.golang.org/api@v0.269.0/internal/third_party/uritemplates/LICENSE;=
md5=3D4ee4feb2b545c2231749e5c54ace343e;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> google.golang.org/genproto/googleapis/api@v0.0.0-20260203192932-546029d2f=
a20/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> google.golang.org/genproto/googleapis/rpc@v0.0.0-20260217215200-42d3e9bed=
b6d/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> google.golang.org/genproto@v0.0.0-20260128011058-8636f8732409/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> google.golang.org/grpc@v1.80.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> google.golang.org/protobuf@v1.36.11/LICENSE;md5=3D02d4002e9171d41a8fad93a=
a7faf3956;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> gopkg.in/evanphx/json-patch.v4@v4.13.0/LICENSE;md5=3D96ae735ca1b4dcdb6b26=
f4ca4b8ba645;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> gopkg.in/inf.v0@v0.9.1/LICENSE;md5=3D13cea479df204c85485b5db6eb1bc9d5;spd=
x=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> gopkg.in/ini.v1@v1.67.1/LICENSE;md5=3D4e2a8d8f9935d6a766a5879a77ddc24d;sp=
dx=3DApache-2.0
> \
> > +    file://pkg/mod/
> gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c;sp=
dx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/api@v0.35.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/apimachinery@v0.35.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/apimachinery@v0.35.3/third_party/forked/golang/LICENSE;md5=3D5d495=
0ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> k8s.io/client-go@v0.35.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;s=
pdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/klog/v2@v2.130.1/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;sp=
dx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/LICENSE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/pkg/internal/third=
_party/go-json-experiment/json/LICENSE;md5=3D9d210c7471ce08e3db5261f33bf8fc=
e6;spdx=3DBSD-3-Clause
> \
> > +    file://pkg/mod/
> k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/pkg/validation/spe=
c/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/utils@v0.0.0-20251002143259-bc988d571ff4/LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> k8s.io/utils@v0.0.0-20251002143259-bc988d571ff4/internal/third_party/fork=
ed/golang/LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=3DBSD-3-Claus=
e
> \
> > +    file://pkg/mod/
> sigs.k8s.io/json@v0.0.0-20250730193827-2d320260d730/LICENSE;md5=3D545d3f2=
3616dee7495323aeb0b098df3;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> sigs.k8s.io/randfill@v1.0.0/LICENSE;md5=3D8f245a894b7d4f5880176fafd88faad=
8;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> sigs.k8s.io/release-utils@v0.12.4/LICENSE;md5=3De3fc50a88d0a364313df4b21e=
f20c29e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> sigs.k8s.io/structured-merge-diff/v6@v6.3.0/LICENSE;md5=3De3fc50a88d0a364=
313df4b21ef20c29e;spdx=3DApache-2.0
> \
> > +    file://pkg/mod/
> sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=3Db5d30dd5bc47d1b56b678ac06dead1c7;sp=
dx=3DMIT
> \
> > +"
> > diff --git a/recipes-containers/cosign/cosign_git.bb
> b/recipes-containers/cosign/cosign_git.bb
> > new file mode 100644
> > index 00000000..09c28317
> > --- /dev/null
> > +++ b/recipes-containers/cosign/cosign_git.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "Container signing, verification and storage in an OCI
> registry"
> > +HOMEPAGE =3D "https://github.com/sigstore/cosign"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042=
dd46
> \
> > +
> file://src/${GO_IMPORT}/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
> > +                    "
> > +
> > +GO_IMPORT =3D "github.com/sigstore/cosign"
> > +GO_INSTALL =3D "${GO_IMPORT}/v3/cmd/cosign"
> > +SRC_URI =3D
> "git://${GO_IMPORT};protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCUR=
I_DESTSUFFIX}"
> > +PV =3D "3.0.6+git"
> > +SRCREV =3D "f1ad3ee952313be5d74a49d67ba0aa8d0d5e351f"
> > +
> > +require ${BPN}-licenses.inc
> > +require ${BPN}-go-mods.inc
> > +
> > +inherit go-mod go-mod-update-modules
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.50.1 (Apple Git-155)
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9745):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9745
> > Mute This Topic: https://lists.yoctoproject.org/mt/118991793/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000eb58ae06508620ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28,=
 2026 at 4:54=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">In message: [meta-virtualization][PATC=
H] cosign: add recipe for container signing tool v3.0.6<br>
on 24/04/2026 Tim Orling via <a href=3D"http://lists.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; Add cosign [1] recipe for sigstore&#39;s [2] container signing, verifi=
cation<br>
&gt; and storage tool [3]. Includes auto-generated Go module dependencies a=
nd<br>
&gt; license tracking via go-mod-update-modules.<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/sigstore/cosign/releases/tag/v3.0.6"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/sigstore/cosign/re=
leases/tag/v3.0.6</a><br>
&gt; [2] <a href=3D"https://www.sigstore.dev/" rel=3D"noreferrer" target=3D=
"_blank">https://www.sigstore.dev/</a><br>
&gt; [3] <a href=3D"https://docs.sigstore.dev/cosign/signing/overview/" rel=
=3D"noreferrer" target=3D"_blank">https://docs.sigstore.dev/cosign/signing/=
overview/</a><br>
<br>
I&#39;ve been using my own hybrid technique for gomodules in meta-virtualiz=
ation<br>
as that allows me to bump dependencies in source verses needing to patch.<b=
r>
<br>
Any objections to me attempting to convert it to that format ?<br></blockqu=
ote><div><br></div><div>Feel free to improve the recipe. I&#39;ll try to le=
arn from your changes ;)</div><div>Thank you!</div><div>--Tim</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/cosign/cosign-go-mods.inc=C2=A0 | 261 +++++++=
++++++++++<br>
&gt;=C2=A0 recipes-containers/cosign/cosign-licenses.inc | 274 ++++++++++++=
++++++<br>
&gt;=C2=A0 recipes-containers/cosign/<a href=3D"http://cosign_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cosign_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 19 ++<br>
&gt;=C2=A0 3 files changed, 554 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-containers/cosign/cosign-go-mods.inc<=
br>
&gt;=C2=A0 create mode 100644 recipes-containers/cosign/cosign-licenses.inc=
<br>
&gt;=C2=A0 create mode 100644 recipes-containers/cosign/<a href=3D"http://c=
osign_git.bb" rel=3D"noreferrer" target=3D"_blank">cosign_git.bb</a><br>
&gt; <br>
&gt; diff --git a/recipes-containers/cosign/cosign-go-mods.inc b/recipes-co=
ntainers/cosign/cosign-go-mods.inc<br>
&gt; new file mode 100644<br>
&gt; index 00000000..afd34fc5<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/cosign/cosign-go-mods.inc<br>
&gt; @@ -0,0 +1,261 @@<br>
&gt; +<br>
&gt; +# This file has been generated by go-mod-update-modules.bbclass<br>
&gt; +#<br>
&gt; +# Do not modify it by hand, as the contents will be replaced when<br>
&gt; +# running the update-modules task.<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go;version=
=3Dv0.123.0;sha256sum=3De9c9509cf75beb9516795eeb113d01a20e2a71496a66ed736b6=
ed2a516878d52" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go;ver=
sion=3Dv0.123.0;sha256sum=3De9c9509cf75beb9516795eeb113d01a20e2a71496a66ed7=
36b6ed2a516878d52</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/auth;vers=
ion=3Dv0.18.2;sha256sum=3D34b85ed8bd9a295eafb429ff3f9eeb7af7102edfe9dc1e3dc=
60455d7113fd5d3" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/a=
uth;version=3Dv0.18.2;sha256sum=3D34b85ed8bd9a295eafb429ff3f9eeb7af7102edfe=
9dc1e3dc60455d7113fd5d3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/auth/oaut=
h2adapt;version=3Dv0.2.8;sha256sum=3D4cd64264bafc4dd05f645452d6e1485adf9230=
9130bd82b4c595db10cd534963" rel=3D"noreferrer" target=3D"_blank">cloud.goog=
le.com/go/auth/oauth2adapt;version=3Dv0.2.8;sha256sum=3D4cd64264bafc4dd05f6=
45452d6e1485adf92309130bd82b4c595db10cd534963</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/compute/m=
etadata;version=3Dv0.9.0;sha256sum=3Df97e35d1c96239b8574054a77e312c95d2c82a=
89c21daf46ffeaea6d5fc59eca" rel=3D"noreferrer" target=3D"_blank">cloud.goog=
le.com/go/compute/metadata;version=3Dv0.9.0;sha256sum=3Df97e35d1c96239b8574=
054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/iam;versi=
on=3Dv1.5.3;sha256sum=3Df153dabeb45cbb3fed0f840da4394f21818451421cbfb2e2874=
0d7efe87123d1" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/iam=
;version=3Dv1.5.3;sha256sum=3Df153dabeb45cbb3fed0f840da4394f21818451421cbfb=
2e28740d7efe87123d1</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/kms;versi=
on=3Dv1.26.0;sha256sum=3D702a9069cd88a80f40f89b2f1df00ac491ffff1abd47bee36b=
3734dd280ebf2e" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/km=
s;version=3Dv1.26.0;sha256sum=3D702a9069cd88a80f40f89b2f1df00ac491ffff1abd4=
7bee36b3734dd280ebf2e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cloud.google.com/go/longrunni=
ng;version=3Dv0.8.0;sha256sum=3D3f7c0501f17f58d774611e588d007121c42707dd76b=
2ffd9577cd870daf44f71" rel=3D"noreferrer" target=3D"_blank">cloud.google.co=
m/go/longrunning;version=3Dv0.8.0;sha256sum=3D3f7c0501f17f58d774611e588d007=
121c42707dd76b2ffd9577cd870daf44f71</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cuelabs.dev/go/oci/ociregistr=
y;version=3Dv0.0.0-20251212221603-3adeb8663819;sha256sum=3D1cc9faec3e7e226d=
fbb13311ab366e166ad5c343994fb4de74aefc41007685a7" rel=3D"noreferrer" target=
=3D"_blank">cuelabs.dev/go/oci/ociregistry;version=3Dv0.0.0-20251212221603-=
3adeb8663819;sha256sum=3D1cc9faec3e7e226dfbb13311ab366e166ad5c343994fb4de74=
aefc41007685a7</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://cuelang.org/go;version=3Dv0.1=
6.0;sha256sum=3D8d04731f2b164d0050140a0a649a271a0fd5db4377b764cb1bbd168ddad=
fd3cd" rel=3D"noreferrer" target=3D"_blank">cuelang.org/go;version=3Dv0.16.=
0;sha256sum=3D8d04731f2b164d0050140a0a649a271a0fd5db4377b764cb1bbd168ddadfd=
3cd</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/AliyunContainerSer=
vice/ack-ram-tool/pkg/credentials/provider;version=3Dv0.14.0;sha256sum=3D90=
d9986ca69eb9dd2129d13ddc3b4265225dbcf2cf1de5ebcbc82ddf0dbc7d75" rel=3D"nore=
ferrer" target=3D"_blank">github.com/AliyunContainerService/ack-ram-tool/pk=
g/credentials/provider;version=3Dv0.14.0;sha256sum=3D90d9986ca69eb9dd2129d1=
3ddc3b4265225dbcf2cf1de5ebcbc82ddf0dbc7d75</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go;version=3Dv68.0.0+incompatible;sha256sum=3Dc40d67ce49f8e2bbf4ca4091cbf=
c05bd3d50117f21d789e32cfa19bdb11ec50c" rel=3D"noreferrer" target=3D"_blank"=
>github.com/Azure/azure-sdk-for-go;version=3Dv68.0.0+incompatible;sha256sum=
=3Dc40d67ce49f8e2bbf4ca4091cbfc05bd3d50117f21d789e32cfa19bdb11ec50c</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go/sdk/azcore;version=3Dv1.21.0;sha256sum=3D763cf24cc12852b7bab952ac524a3=
0bc7a6047ce6c446397a5b85234f72fccc2" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/Azure/azure-sdk-for-go/sdk/azcore;version=3Dv1.21.0;sha256sum=3D7=
63cf24cc12852b7bab952ac524a30bc7a6047ce6c446397a5b85234f72fccc2</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go/sdk/azidentity;version=3Dv1.13.1;sha256sum=3D98012cfee26379a030c430ee2=
218c396201a9f9a35f17867c6f5c8a7cb6839a5" rel=3D"noreferrer" target=3D"_blan=
k">github.com/Azure/azure-sdk-for-go/sdk/azidentity;version=3Dv1.13.1;sha25=
6sum=3D98012cfee26379a030c430ee2218c396201a9f9a35f17867c6f5c8a7cb6839a5</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go/sdk/internal;version=3Dv1.11.2;sha256sum=3D88c28c7f95f1ab392d5bf5e9856=
9b30b834721978e2d7d4dc2eed1bc08f6f4e8" rel=3D"noreferrer" target=3D"_blank"=
>github.com/Azure/azure-sdk-for-go/sdk/internal;version=3Dv1.11.2;sha256sum=
=3D88c28c7f95f1ab392d5bf5e98569b30b834721978e2d7d4dc2eed1bc08f6f4e8</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go/sdk/security/keyvault/azkeys;version=3Dv1.4.0;sha256sum=3D44808d09830b=
847b6f969fdead1d87cb0b1f6ab5abf146d4dd762dc0561bc587" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azk=
eys;version=3Dv1.4.0;sha256sum=3D44808d09830b847b6f969fdead1d87cb0b1f6ab5ab=
f146d4dd762dc0561bc587</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/azure-sdk-fo=
r-go/sdk/security/keyvault/internal;version=3Dv1.2.0;sha256sum=3Dfea8b9a651=
7633da1b023698f9be20868fa21ef5886847bc9a939fbac89c7dee" rel=3D"noreferrer" =
target=3D"_blank">github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/i=
nternal;version=3Dv1.2.0;sha256sum=3Dfea8b9a6517633da1b023698f9be20868fa21e=
f5886847bc9a939fbac89c7dee</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest;=
version=3Dv14.2.0+incompatible;sha256sum=3D89ac786da5b108e594bb1fbbf8f39a82=
2fc1d994be1ff7cc6e860e8b45f3d80c" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/Azure/go-autorest;version=3Dv14.2.0+incompatible;sha256sum=3D89ac786=
da5b108e594bb1fbbf8f39a822fc1d994be1ff7cc6e860e8b45f3d80c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
autorest;version=3Dv0.11.29;sha256sum=3Df3e965c991c8205cd97a4616ade8dd0d179=
f4b849a56420e0dd2bcd8e0d74cec" rel=3D"noreferrer" target=3D"_blank">github.=
com/Azure/go-autorest/autorest;version=3Dv0.11.29;sha256sum=3Df3e965c991c82=
05cd97a4616ade8dd0d179f4b849a56420e0dd2bcd8e0d74cec</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
autorest/adal;version=3Dv0.9.23;sha256sum=3Df65e30aa3f755d9c6ce990c9600ddf5=
094b45659eb57afc4d9750ddf00a553f0" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/Azure/go-autorest/autorest/adal;version=3Dv0.9.23;sha256sum=3Df65e3=
0aa3f755d9c6ce990c9600ddf5094b45659eb57afc4d9750ddf00a553f0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
autorest/azure/auth;version=3Dv0.5.12;sha256sum=3Dc626f2bd8952bbe98d7908044=
1ec856a2440c7405465da6d7ae6b8ff7ccc2c12" rel=3D"noreferrer" target=3D"_blan=
k">github.com/Azure/go-autorest/autorest/azure/auth;version=3Dv0.5.12;sha25=
6sum=3Dc626f2bd8952bbe98d79080441ec856a2440c7405465da6d7ae6b8ff7ccc2c12</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
autorest/azure/cli;version=3Dv0.4.6;sha256sum=3Dcdc19569bc0dd13c3e52dc9babb=
064a50d0cf15bf5806357b31ba27b6e52a6be" rel=3D"noreferrer" target=3D"_blank"=
>github.com/Azure/go-autorest/autorest/azure/cli;version=3Dv0.4.6;sha256sum=
=3Dcdc19569bc0dd13c3e52dc9babb064a50d0cf15bf5806357b31ba27b6e52a6be</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
autorest/date;version=3Dv0.3.0;sha256sum=3D7b59c0421eaf8549f20d17aab7e3e462=
1e1798de1119dac65a04c110d110d64d" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/Azure/go-autorest/autorest/date;version=3Dv0.3.0;sha256sum=3D7b59c04=
21eaf8549f20d17aab7e3e4621e1798de1119dac65a04c110d110d64d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
logger;version=3Dv0.2.1;sha256sum=3D90c84e126b503027f69d232f4ce5758ae01d08e=
a729c71539ebff851f2477b49" rel=3D"noreferrer" target=3D"_blank">github.com/=
Azure/go-autorest/logger;version=3Dv0.2.1;sha256sum=3D90c84e126b503027f69d2=
32f4ce5758ae01d08ea729c71539ebff851f2477b49</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/Azure/go-autorest/=
tracing;version=3Dv0.6.0;sha256sum=3Db7296ba64ecae67c83ae1c89da47c6f65c2ff0=
807027e301daccab32673914b3" rel=3D"noreferrer" target=3D"_blank">github.com=
/Azure/go-autorest/tracing;version=3Dv0.6.0;sha256sum=3Db7296ba64ecae67c83a=
e1c89da47c6f65c2ff0807027e301daccab32673914b3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/AzureAD/microsoft-=
authentication-library-for-go;version=3Dv1.6.0;sha256sum=3Db5bd3c20f1152ee7=
1546ed7d11466878f85cef9dee35b47ad6218e621d9cc4dc" rel=3D"noreferrer" target=
=3D"_blank">github.com/AzureAD/microsoft-authentication-library-for-go;vers=
ion=3Dv1.6.0;sha256sum=3Db5bd3c20f1152ee71546ed7d11466878f85cef9dee35b47ad6=
218e621d9cc4dc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/agnivade/levenshte=
in;version=3Dv1.2.1;sha256sum=3D26bdb12f38a5ca1c45a666e8dea1c409189a383443f=
a14f4ff04f75af7022534" rel=3D"noreferrer" target=3D"_blank">github.com/agni=
vade/levenshtein;version=3Dv1.2.1;sha256sum=3D26bdb12f38a5ca1c45a666e8dea1c=
409189a383443fa14f4ff04f75af7022534</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/al=
ibabacloud-gateway-spi;version=3Dv0.0.4;sha256sum=3D07fec6942fd2a40ecd197fb=
a04920a7893b6313899950f9f06c2254f12c39268" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/alibabacloud-go/alibabacloud-gateway-spi;version=3Dv0.0.4;s=
ha256sum=3D07fec6942fd2a40ecd197fba04920a7893b6313899950f9f06c2254f12c39268=
</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/cr=
-20160607;version=3Dv1.0.1;sha256sum=3D218d719db6ddf2d88c0258883c251f708cb8=
a4696d071a25061f6c646c6d8273" rel=3D"noreferrer" target=3D"_blank">github.c=
om/alibabacloud-go/cr-20160607;version=3Dv1.0.1;sha256sum=3D218d719db6ddf2d=
88c0258883c251f708cb8a4696d071a25061f6c646c6d8273</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/cr=
-20181201;version=3Dv1.0.10;sha256sum=3De895c3c0877d704c37c6c5392d3e9986339=
850f1ee0373c6bc881e48b298f59d" rel=3D"noreferrer" target=3D"_blank">github.=
com/alibabacloud-go/cr-20181201;version=3Dv1.0.10;sha256sum=3De895c3c0877d7=
04c37c6c5392d3e9986339850f1ee0373c6bc881e48b298f59d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/da=
rabonba-openapi;version=3Dv0.2.1;sha256sum=3Dd39d097d12a30c4a6e7bd4ed640d9c=
9f81e7722cbf487742c0204efa53506e9a" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/alibabacloud-go/darabonba-openapi;version=3Dv0.2.1;sha256sum=3Dd39=
d097d12a30c4a6e7bd4ed640d9c9f81e7722cbf487742c0204efa53506e9a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/de=
bug;version=3Dv1.0.0;sha256sum=3Dca74856ab94c36c0c1631eeedfb5cf8f7d1f2fea44=
a6cee9e2a611c5955f0762" rel=3D"noreferrer" target=3D"_blank">github.com/ali=
babacloud-go/debug;version=3Dv1.0.0;sha256sum=3Dca74856ab94c36c0c1631eeedfb=
5cf8f7d1f2fea44a6cee9e2a611c5955f0762</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/en=
dpoint-util;version=3Dv1.1.1;sha256sum=3D0711665f45c66ad2051ee9c08eb0cc59a9=
c77baacafeea8b791b8eb782c7fa6f" rel=3D"noreferrer" target=3D"_blank">github=
.com/alibabacloud-go/endpoint-util;version=3Dv1.1.1;sha256sum=3D0711665f45c=
66ad2051ee9c08eb0cc59a9c77baacafeea8b791b8eb782c7fa6f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/op=
enapi-util;version=3Dv0.1.0;sha256sum=3D117c207e8e301207ab029cc33fc60e7724e=
d988ff959935510ee45b1ccf7ee62" rel=3D"noreferrer" target=3D"_blank">github.=
com/alibabacloud-go/openapi-util;version=3Dv0.1.0;sha256sum=3D117c207e8e301=
207ab029cc33fc60e7724ed988ff959935510ee45b1ccf7ee62</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/te=
a;version=3Dv1.2.1;sha256sum=3Dc3cfbe14863c74bc7ae0edce4de380f0db62d7432bfd=
4800eb328c135fa03f86" rel=3D"noreferrer" target=3D"_blank">github.com/aliba=
bacloud-go/tea;version=3Dv1.2.1;sha256sum=3Dc3cfbe14863c74bc7ae0edce4de380f=
0db62d7432bfd4800eb328c135fa03f86</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/te=
a-utils;version=3Dv1.4.5;sha256sum=3D1390da07d391ce5e34ce7d01b32e44283cd82c=
52c30cc8e3a694b0e2f3d08ddb" rel=3D"noreferrer" target=3D"_blank">github.com=
/alibabacloud-go/tea-utils;version=3Dv1.4.5;sha256sum=3D1390da07d391ce5e34c=
e7d01b32e44283cd82c52c30cc8e3a694b0e2f3d08ddb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alibabacloud-go/te=
a-xml;version=3Dv1.1.3;sha256sum=3D41202fed6a5acef24b413d86ff4977c18008876c=
fd82d7aa81ee4f4d1334c2ae" rel=3D"noreferrer" target=3D"_blank">github.com/a=
libabacloud-go/tea-xml;version=3Dv1.1.3;sha256sum=3D41202fed6a5acef24b413d8=
6ff4977c18008876cfd82d7aa81ee4f4d1334c2ae</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aliyun/credentials=
-go;version=3Dv1.3.2;sha256sum=3D4ffe97620cb492a48965599a0f6e2e7eebb70a97ae=
774ade3bede9fc1edff661" rel=3D"noreferrer" target=3D"_blank">github.com/ali=
yun/credentials-go;version=3Dv1.3.2;sha256sum=3D4ffe97620cb492a48965599a0f6=
e2e7eebb70a97ae774ade3bede9fc1edff661</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/asaskevich/govalid=
ator;version=3Dv0.0.0-20230301143203-a9d515a09cc2;sha256sum=3D0f8ec67bbc585=
d29ec115c0885cef6f2431a422cc1cc10008e466ebe8be5dc37" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/asaskevich/govalidator;version=3Dv0.0.0-202303011=
43203-a9d515a09cc2;sha256sum=3D0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc=
10008e466ebe8be5dc37</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2;=
version=3Dv1.41.2;sha256sum=3D02bc90aff4c5db96bf3b97c6b898be16ad19850fac6ad=
d54bfe8cf47c9456966" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aw=
s-sdk-go-v2;version=3Dv1.41.2;sha256sum=3D02bc90aff4c5db96bf3b97c6b898be16a=
d19850fac6add54bfe8cf47c9456966</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
config;version=3Dv1.32.10;sha256sum=3D6bd6e853abde0a04193c72f3e76a6496aa6e8=
bb4a31c72936ee6a445bae86dc1" rel=3D"noreferrer" target=3D"_blank">github.co=
m/aws/aws-sdk-go-v2/config;version=3Dv1.32.10;sha256sum=3D6bd6e853abde0a041=
93c72f3e76a6496aa6e8bb4a31c72936ee6a445bae86dc1</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
credentials;version=3Dv1.19.10;sha256sum=3D3db3769e1ece97e7426609583c040498=
5a07b6346e3b77266ac59c8963bbd7e7" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/aws/aws-sdk-go-v2/credentials;version=3Dv1.19.10;sha256sum=3D3db3769=
e1ece97e7426609583c0404985a07b6346e3b77266ac59c8963bbd7e7</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
feature/ec2/imds;version=3Dv1.18.18;sha256sum=3D49f9782b1957811bbcef0f5f23d=
24d05841b0695c67a012c6f1239e7c0b0e7f9" rel=3D"noreferrer" target=3D"_blank"=
>github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=3Dv1.18.18;sha256sum=
=3D49f9782b1957811bbcef0f5f23d24d05841b0695c67a012c6f1239e7c0b0e7f9</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
internal/configsources;version=3Dv1.4.18;sha256sum=3D30853dfcc993ba7a7d0a9f=
8436f51dcf70b426abd7d44c817d45f72f1cd85cf3" rel=3D"noreferrer" target=3D"_b=
lank">github.com/aws/aws-sdk-go-v2/internal/configsources;version=3Dv1.4.18=
;sha256sum=3D30853dfcc993ba7a7d0a9f8436f51dcf70b426abd7d44c817d45f72f1cd85c=
f3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
internal/endpoints/v2;version=3Dv2.7.18;sha256sum=3D6eb3aa8e1b8288f69fce5d1=
5abd31909064c119bbbf0edcd94bb404018e1f998" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=3Dv2.7.18;s=
ha256sum=3D6eb3aa8e1b8288f69fce5d15abd31909064c119bbbf0edcd94bb404018e1f998=
</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
internal/ini;version=3Dv1.8.4;sha256sum=3Df34dd5f3521bdb07f657b88348bbafbb6=
8f41d134bcb615356122e56c1117600" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/aws/aws-sdk-go-v2/internal/ini;version=3Dv1.8.4;sha256sum=3Df34dd5f35=
21bdb07f657b88348bbafbb68f41d134bcb615356122e56c1117600</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/ecr;version=3Dv1.55.3;sha256sum=3D1080996028df7bb2e17ce1c1511b5587e=
8e6522ec4ad73e1e431abe558009d25" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/aws/aws-sdk-go-v2/service/ecr;version=3Dv1.55.3;sha256sum=3D108099602=
8df7bb2e17ce1c1511b5587e8e6522ec4ad73e1e431abe558009d25</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/ecrpublic;version=3Dv1.38.10;sha256sum=3D07284fd1309ae2351c22bbe715=
3ef7f24a128d6197d11b5d747d3ce9c441fd78" rel=3D"noreferrer" target=3D"_blank=
">github.com/aws/aws-sdk-go-v2/service/ecrpublic;version=3Dv1.38.10;sha256s=
um=3D07284fd1309ae2351c22bbe7153ef7f24a128d6197d11b5d747d3ce9c441fd78</a> \=
<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/internal/accept-encoding;version=3Dv1.13.5;sha256sum=3Df4365491d985=
ec3e9c886427643361fcec012e5a8954bc4e36fc73ce093ddaf3" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/aws/aws-sdk-go-v2/service/internal/accept-encodi=
ng;version=3Dv1.13.5;sha256sum=3Df4365491d985ec3e9c886427643361fcec012e5a89=
54bc4e36fc73ce093ddaf3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/internal/presigned-url;version=3Dv1.13.18;sha256sum=3D44a24021cd943=
a2a3410049272a4585cdd804e444a94499efc30c58356c05bab" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;=
version=3Dv1.13.18;sha256sum=3D44a24021cd943a2a3410049272a4585cdd804e444a94=
499efc30c58356c05bab</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/kms;version=3Dv1.50.1;sha256sum=3D29a88aad36078661fe4481009b80671dc=
cff222aea241c231813ece4bddf5653" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/aws/aws-sdk-go-v2/service/kms;version=3Dv1.50.1;sha256sum=3D29a88aad3=
6078661fe4481009b80671dccff222aea241c231813ece4bddf5653</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/signin;version=3Dv1.0.6;sha256sum=3Dc5ef46f10cac219c82efae68542e3b1=
1c79f745a83836df3be624f812874d3d4" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/aws/aws-sdk-go-v2/service/signin;version=3Dv1.0.6;sha256sum=3Dc5ef4=
6f10cac219c82efae68542e3b11c79f745a83836df3be624f812874d3d4</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/sso;version=3Dv1.30.11;sha256sum=3D1b4c55e13d47f1af36bdc17e9c8b7eb9=
b0741e658d65bd6a27b01529b92e578c" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/aws/aws-sdk-go-v2/service/sso;version=3Dv1.30.11;sha256sum=3D1b4c55e=
13d47f1af36bdc17e9c8b7eb9b0741e658d65bd6a27b01529b92e578c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/ssooidc;version=3Dv1.35.15;sha256sum=3Dbff63145dbde5c3b40108f65e916=
5af03db979a37f2cc3235565c5f545abf216" rel=3D"noreferrer" target=3D"_blank">=
github.com/aws/aws-sdk-go-v2/service/ssooidc;version=3Dv1.35.15;sha256sum=
=3Dbff63145dbde5c3b40108f65e9165af03db979a37f2cc3235565c5f545abf216</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/aws-sdk-go-v2/=
service/sts;version=3Dv1.41.7;sha256sum=3D8947d4971e55f7c3f0fe037630e509abd=
91bd0be913e627a10db6da7332cfc14" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/aws/aws-sdk-go-v2/service/sts;version=3Dv1.41.7;sha256sum=3D8947d4971=
e55f7c3f0fe037630e509abd91bd0be913e627a10db6da7332cfc14</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/aws/smithy-go;vers=
ion=3Dv1.24.1;sha256sum=3D7bea6fb2be620fdc7e6fd4364478d9eca03e9b130cb2088e3=
00ed2847e26a5ea" rel=3D"noreferrer" target=3D"_blank">github.com/aws/smithy=
-go;version=3Dv1.24.1;sha256sum=3D7bea6fb2be620fdc7e6fd4364478d9eca03e9b130=
cb2088e300ed2847e26a5ea</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/awslabs/amazon-ecr=
-credential-helper/ecr-login;version=3Dv0.12.0;sha256sum=3D4502354101353d12=
ef87a27db3afc568865eb10d43c4c5b36b5e172ffb75829a" rel=3D"noreferrer" target=
=3D"_blank">github.com/awslabs/amazon-ecr-credential-helper/ecr-login;versi=
on=3Dv0.12.0;sha256sum=3D4502354101353d12ef87a27db3afc568865eb10d43c4c5b36b=
5e172ffb75829a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/blang/semver;versi=
on=3Dv3.5.1+incompatible;sha256sum=3D8d032399cf835b93f7cf641b5477a31a002059=
eed7888a775f97bd3e9677ad3c" rel=3D"noreferrer" target=3D"_blank">github.com=
/blang/semver;version=3Dv3.5.1+incompatible;sha256sum=3D8d032399cf835b93f7c=
f641b5477a31a002059eed7888a775f97bd3e9677ad3c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/buildkite/agent/v3=
;version=3Dv3.118.0;sha256sum=3D6ded12a893b9b0881f6061d1a0fdc7a3f9d7ef4691f=
b6490d82d381c80aaa97b" rel=3D"noreferrer" target=3D"_blank">github.com/buil=
dkite/agent/v3;version=3Dv3.118.0;sha256sum=3D6ded12a893b9b0881f6061d1a0fdc=
7a3f9d7ef4691fb6490d82d381c80aaa97b</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/buildkite/go-pipel=
ine;version=3Dv0.16.0;sha256sum=3Dfcc049d51dc8778f57571df98af46fc3e30b31a39=
466ee95abd29aad7b9501a0" rel=3D"noreferrer" target=3D"_blank">github.com/bu=
ildkite/go-pipeline;version=3Dv0.16.0;sha256sum=3Dfcc049d51dc8778f57571df98=
af46fc3e30b31a39466ee95abd29aad7b9501a0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/buildkite/interpol=
ate;version=3Dv0.1.5;sha256sum=3Df7f46fd8fa141675b86e663841f649242422e61f29=
c86ce8831bdf53ecbd3683" rel=3D"noreferrer" target=3D"_blank">github.com/bui=
ldkite/interpolate;version=3Dv0.1.5;sha256sum=3Df7f46fd8fa141675b86e663841f=
649242422e61f29c86ce8831bdf53ecbd3683</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/buildkite/roko;ver=
sion=3Dv1.4.0;sha256sum=3De875911054813654014a84a90317927a5e6a248f3fd2b0d56=
a6c3b815c610e0a" rel=3D"noreferrer" target=3D"_blank">github.com/buildkite/=
roko;version=3Dv1.4.0;sha256sum=3De875911054813654014a84a90317927a5e6a248f3=
fd2b0d56a6c3b815c610e0a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cenkalti/backoff/v=
4;version=3Dv4.3.0;sha256sum=3Def220b1ebf3bff4c46bbad5b2e123030e812b722b9e9=
dc88bc35956f9c622c2a" rel=3D"noreferrer" target=3D"_blank">github.com/cenka=
lti/backoff/v4;version=3Dv4.3.0;sha256sum=3Def220b1ebf3bff4c46bbad5b2e12303=
0e812b722b9e9dc88bc35956f9c622c2a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cenkalti/backoff/v=
5;version=3Dv5.0.3;sha256sum=3D58e4d9014277bc1c5c7ab64539137923964cc3920303=
a4f771d02a532939bedb" rel=3D"noreferrer" target=3D"_blank">github.com/cenka=
lti/backoff/v5;version=3Dv5.0.3;sha256sum=3D58e4d9014277bc1c5c7ab6453913792=
3964cc3920303a4f771d02a532939bedb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cespare/xxhash/v2;=
version=3Dv2.3.0;sha256sum=3D145a26cdc7c49db566017b807c4989ee7f7ddeb569423e=
9cb99f995fac3621d3" rel=3D"noreferrer" target=3D"_blank">github.com/cespare=
/xxhash/v2;version=3Dv2.3.0;sha256sum=3D145a26cdc7c49db566017b807c4989ee7f7=
ddeb569423e9cb99f995fac3621d3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/chrismellard/docke=
r-credential-acr-env;version=3Dv0.0.0-20230304212654-82a0ddb27589;sha256sum=
=3D50a1e7708257a9014d9463fb5ae1401da96859a84a3e91ed861b3cc5830d2329" rel=3D=
"noreferrer" target=3D"_blank">github.com/chrismellard/docker-credential-ac=
r-env;version=3Dv0.0.0-20230304212654-82a0ddb27589;sha256sum=3D50a1e7708257=
a9014d9463fb5ae1401da96859a84a3e91ed861b3cc5830d2329</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/clbanning/mxj/v2;v=
ersion=3Dv2.7.0;sha256sum=3D4451f64589cac692c9caa68be16551d6391949379a5bcea=
e5455070198dd0918" rel=3D"noreferrer" target=3D"_blank">github.com/clbannin=
g/mxj/v2;version=3Dv2.7.0;sha256sum=3D4451f64589cac692c9caa68be16551d639194=
9379a5bceae5455070198dd0918</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cockroachdb/apd/v3=
;version=3Dv3.2.1;sha256sum=3D6ad54bb71a36fba8ca6725a00d916e51815a4c68de540=
96313ca6fffda6c87c2" rel=3D"noreferrer" target=3D"_blank">github.com/cockro=
achdb/apd/v3;version=3Dv3.2.1;sha256sum=3D6ad54bb71a36fba8ca6725a00d916e518=
15a4c68de54096313ca6fffda6c87c2</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/common-nighthawk/g=
o-figure;version=3Dv0.0.0-20210622060536-734e95fb86be;sha256sum=3Dd0e1080f4=
21d295735e6084ca0879bcf00b059d2af2246679be96a230b71c456" rel=3D"noreferrer"=
 target=3D"_blank">github.com/common-nighthawk/go-figure;version=3Dv0.0.0-2=
0210622060536-734e95fb86be;sha256sum=3Dd0e1080f421d295735e6084ca0879bcf00b0=
59d2af2246679be96a230b71c456</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/containerd/stargz-=
snapshotter/estargz;version=3Dv0.18.2;sha256sum=3D3ba05758c81ad89701d66bb34=
a9025e688d3e6b58784c2cbb4c6adfbae574435" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containerd/stargz-snapshotter/estargz;version=3Dv0.18.2;sha25=
6sum=3D3ba05758c81ad89701d66bb34a9025e688d3e6b58784c2cbb4c6adfbae574435</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/coreos/go-oidc/v3;=
version=3Dv3.17.0;sha256sum=3Dfba667f687448a228315d6f0cfd00a5fa9ab8ad9b511e=
38575a699afc0b30aeb" rel=3D"noreferrer" target=3D"_blank">github.com/coreos=
/go-oidc/v3;version=3Dv3.17.0;sha256sum=3Dfba667f687448a228315d6f0cfd00a5fa=
9ab8ad9b511e38575a699afc0b30aeb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cyberphone/json-ca=
nonicalization;version=3Dv0.0.0-20241213102144-19d51d7fe467;sha256sum=3D949=
2fa89d9f2543890346672d239c494ccba4073be51f338b50e8f749792e25a" rel=3D"noref=
errer" target=3D"_blank">github.com/cyberphone/json-canonicalization;versio=
n=3Dv0.0.0-20241213102144-19d51d7fe467;sha256sum=3D9492fa89d9f2543890346672=
d239c494ccba4073be51f338b50e8f749792e25a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/davecgh/go-spew;ve=
rsion=3Dv1.1.2-0.20180830191138-d8f796af33cc;sha256sum=3Db4d0923b169b194f00=
16ec46f3df1ab0c68e27999743e43fe2de59ecb2484128" rel=3D"noreferrer" target=
=3D"_blank">github.com/davecgh/go-spew;version=3Dv1.1.2-0.20180830191138-d8=
f796af33cc;sha256sum=3Db4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de=
59ecb2484128</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/digitorus/pkcs7;ve=
rsion=3Dv0.0.0-20230818184609-3a137a874352;sha256sum=3Dc4c8c4f4f331709c7c9d=
c40035fa0a9c23c98e8a7777cfaafe2013301e69bbfb" rel=3D"noreferrer" target=3D"=
_blank">github.com/digitorus/pkcs7;version=3Dv0.0.0-20230818184609-3a137a87=
4352;sha256sum=3Dc4c8c4f4f331709c7c9dc40035fa0a9c23c98e8a7777cfaafe2013301e=
69bbfb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/digitorus/timestam=
p;version=3Dv0.0.0-20231217203849-220c5c2851b7;sha256sum=3D0e79eb53bb9d500f=
26e33a58bb0cced31d72f91b3205c7685e6126cce267c683" rel=3D"noreferrer" target=
=3D"_blank">github.com/digitorus/timestamp;version=3Dv0.0.0-20231217203849-=
220c5c2851b7;sha256sum=3D0e79eb53bb9d500f26e33a58bb0cced31d72f91b3205c7685e=
6126cce267c683</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/dimchansky/utfbom;=
version=3Dv1.1.1;sha256sum=3D0c1a11101602d5f57ac3e790c0b72e09ff87d8d535535f=
43fbee9e6a42327350" rel=3D"noreferrer" target=3D"_blank">github.com/dimchan=
sky/utfbom;version=3Dv1.1.1;sha256sum=3D0c1a11101602d5f57ac3e790c0b72e09ff8=
7d8d535535f43fbee9e6a42327350</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/docker/cli;version=
=3Dv29.3.0+incompatible;sha256sum=3D2612c3a3b39af2662e22ff8c55c6bea681191e6=
174e3ef3995de81135631424a" rel=3D"noreferrer" target=3D"_blank">github.com/=
docker/cli;version=3Dv29.3.0+incompatible;sha256sum=3D2612c3a3b39af2662e22f=
f8c55c6bea681191e6174e3ef3995de81135631424a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/docker/distributio=
n;version=3Dv2.8.3+incompatible;sha256sum=3D8f08722c5459cb4d9aa006e1fae0949=
97da372098f4e14a59215b1ed3d48738a" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/docker/distribution;version=3Dv2.8.3+incompatible;sha256sum=3D8f087=
22c5459cb4d9aa006e1fae094997da372098f4e14a59215b1ed3d48738a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/docker/docker-cred=
ential-helpers;version=3Dv0.9.5;sha256sum=3D2a01551502cf37b523c7137d92ec8fb=
c99aaa5a4b83b2b8f27fb0b47a394b3c5" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/docker/docker-credential-helpers;version=3Dv0.9.5;sha256sum=3D2a015=
51502cf37b523c7137d92ec8fbc99aaa5a4b83b2b8f27fb0b47a394b3c5</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/dustin/go-humanize=
;version=3Dv1.0.1;sha256sum=3D319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1=
a1a90484ad94679fa46" rel=3D"noreferrer" target=3D"_blank">github.com/dustin=
/go-humanize;version=3Dv1.0.1;sha256sum=3D319404ea84c8a4e2d3d83f30988b006e7=
dd04976de3e1a1a90484ad94679fa46</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/emicklei/go-restfu=
l/v3;version=3Dv3.13.0;sha256sum=3D06bd60484b324de0b8e4366d4ed326db2e1dc730=
459b46e19a5306a108439c77" rel=3D"noreferrer" target=3D"_blank">github.com/e=
micklei/go-restful/v3;version=3Dv3.13.0;sha256sum=3D06bd60484b324de0b8e4366=
d4ed326db2e1dc730459b46e19a5306a108439c77</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/emicklei/proto;ver=
sion=3Dv1.14.3;sha256sum=3Dbb06405e5df4c1b41a7f962866e9d50866f9f9bd6b7e2282=
938b3b57bcaf556e" rel=3D"noreferrer" target=3D"_blank">github.com/emicklei/=
proto;version=3Dv1.14.3;sha256sum=3Dbb06405e5df4c1b41a7f962866e9d50866f9f9b=
d6b7e2282938b3b57bcaf556e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/felixge/httpsnoop;=
version=3Dv1.0.4;sha256sum=3D75aa471311265e9860df0e523400b4650ed0c1a3326278=
6a421f07226792e494" rel=3D"noreferrer" target=3D"_blank">github.com/felixge=
/httpsnoop;version=3Dv1.0.4;sha256sum=3D75aa471311265e9860df0e523400b4650ed=
0c1a33262786a421f07226792e494</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/fsnotify/fsnotify;=
version=3Dv1.9.0;sha256sum=3D94e64824b23591b7aa504e3321d5ec3f57de88f4d49882=
eaefbbf6820dab746e" rel=3D"noreferrer" target=3D"_blank">github.com/fsnotif=
y/fsnotify;version=3Dv1.9.0;sha256sum=3D94e64824b23591b7aa504e3321d5ec3f57d=
e88f4d49882eaefbbf6820dab746e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/fxamacker/cbor/v2;=
version=3Dv2.9.0;sha256sum=3D5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf12=
5ab27b97826140d97a" rel=3D"noreferrer" target=3D"_blank">github.com/fxamack=
er/cbor/v2;version=3Dv2.9.0;sha256sum=3D5b0ec6424bd522aeeeab30cbdcad6f40bf9=
76a9a2ddf125ab27b97826140d97a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-chi/chi/v5;vers=
ion=3Dv5.2.5;sha256sum=3Df78c1525f8b3af815bcf3406c0aba1f272eff96413ff518746=
77bf8a314fcad8" rel=3D"noreferrer" target=3D"_blank">github.com/go-chi/chi/=
v5;version=3Dv5.2.5;sha256sum=3Df78c1525f8b3af815bcf3406c0aba1f272eff96413f=
f51874677bf8a314fcad8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-jose/go-jose/v4=
;version=3Dv4.1.4;sha256sum=3D06a37b6668012a2dd109a5f71f6ae15387dc808b35d3c=
f73f5e406e78a17b027" rel=3D"noreferrer" target=3D"_blank">github.com/go-jos=
e/go-jose/v4;version=3Dv4.1.4;sha256sum=3D06a37b6668012a2dd109a5f71f6ae1538=
7dc808b35d3cf73f5e406e78a17b027</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-logr/logr;versi=
on=3Dv1.4.3;sha256sum=3D523d7a3587fe73f61ef41c8bc627f7d7f38de8104d46278154b=
307e60770ad70" rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/logr=
;version=3Dv1.4.3;sha256sum=3D523d7a3587fe73f61ef41c8bc627f7d7f38de8104d462=
78154b307e60770ad70</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-logr/stdr;versi=
on=3Dv1.2.2;sha256sum=3D9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0=
476e1fd8f7fef" rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/stdr=
;version=3Dv1.2.2;sha256sum=3D9dd6893bf700198485ae699640b49bc1efbc6c73b37cb=
5792a0476e1fd8f7fef</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/analysi=
s;version=3Dv0.24.3;sha256sum=3D9d0a3b9a0fe14bb4b4880d93f98c459921d1ec4bcd1=
60c1de23433c24285f7e5" rel=3D"noreferrer" target=3D"_blank">github.com/go-o=
penapi/analysis;version=3Dv0.24.3;sha256sum=3D9d0a3b9a0fe14bb4b4880d93f98c4=
59921d1ec4bcd160c1de23433c24285f7e5</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/errors;=
version=3Dv0.22.7;sha256sum=3D815a7979d3e3c7048b8bcb82d59c9e3de4fc7882c7de3=
a9b9e94eea02fba2651" rel=3D"noreferrer" target=3D"_blank">github.com/go-ope=
napi/errors;version=3Dv0.22.7;sha256sum=3D815a7979d3e3c7048b8bcb82d59c9e3de=
4fc7882c7de3a9b9e94eea02fba2651</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/jsonpoi=
nter;version=3Dv0.22.5;sha256sum=3Dc77c1b57229c8d8cdd8d17a7137dbb44e10ec8aa=
1e24691bb380485b759a4e37" rel=3D"noreferrer" target=3D"_blank">github.com/g=
o-openapi/jsonpointer;version=3Dv0.22.5;sha256sum=3Dc77c1b57229c8d8cdd8d17a=
7137dbb44e10ec8aa1e24691bb380485b759a4e37</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/jsonref=
erence;version=3Dv0.21.5;sha256sum=3De451bfc44c231ea285921a412f63b47518c352=
9cc29ba3a67d8293a9e57f0bb8" rel=3D"noreferrer" target=3D"_blank">github.com=
/go-openapi/jsonreference;version=3Dv0.21.5;sha256sum=3De451bfc44c231ea2859=
21a412f63b47518c3529cc29ba3a67d8293a9e57f0bb8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/loads;v=
ersion=3Dv0.23.3;sha256sum=3D51a80f3cdfdc4b12ee2c7bac33395e031dbfcc7673d308=
7d91cd77506a729eb9" rel=3D"noreferrer" target=3D"_blank">github.com/go-open=
api/loads;version=3Dv0.23.3;sha256sum=3D51a80f3cdfdc4b12ee2c7bac33395e031db=
fcc7673d3087d91cd77506a729eb9</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/runtime=
;version=3Dv0.29.3;sha256sum=3D238a196a270d224d4e558719e8ac0606d4d1729cb9f3=
1957584fe14cac179e9f" rel=3D"noreferrer" target=3D"_blank">github.com/go-op=
enapi/runtime;version=3Dv0.29.3;sha256sum=3D238a196a270d224d4e558719e8ac060=
6d4d1729cb9f31957584fe14cac179e9f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/spec;ve=
rsion=3Dv0.22.4;sha256sum=3D3a0ed5b0ee766e01758a08afb06ae7d0ca9b1a877528a4e=
3c94056634d5534d8" rel=3D"noreferrer" target=3D"_blank">github.com/go-opena=
pi/spec;version=3Dv0.22.4;sha256sum=3D3a0ed5b0ee766e01758a08afb06ae7d0ca9b1=
a877528a4e3c94056634d5534d8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/strfmt;=
version=3Dv0.26.0;sha256sum=3D82d8e99220f9ab4fd7d53ccf5fe96638f8b18858d18e9=
94434f358d10dc95d12" rel=3D"noreferrer" target=3D"_blank">github.com/go-ope=
napi/strfmt;version=3Dv0.26.0;sha256sum=3D82d8e99220f9ab4fd7d53ccf5fe96638f=
8b18858d18e994434f358d10dc95d12</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag;ve=
rsion=3Dv0.25.5;sha256sum=3Daa93ca1f6074ff1d4abb336a41db19e5c8e6be2391bc207=
b4bb9ee20c7bebd6d" rel=3D"noreferrer" target=3D"_blank">github.com/go-opena=
pi/swag;version=3Dv0.25.5;sha256sum=3Daa93ca1f6074ff1d4abb336a41db19e5c8e6b=
e2391bc207b4bb9ee20c7bebd6d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/cm=
dutils;version=3Dv0.25.5;sha256sum=3Dc9b01c6c9aad8e72c59a570c8acc140e8f0522=
ce57322b3bf81dfdf0f73e54e8" rel=3D"noreferrer" target=3D"_blank">github.com=
/go-openapi/swag/cmdutils;version=3Dv0.25.5;sha256sum=3Dc9b01c6c9aad8e72c59=
a570c8acc140e8f0522ce57322b3bf81dfdf0f73e54e8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/co=
nv;version=3Dv0.25.5;sha256sum=3Dc02fe7118d58720cbd83bc7c0c37edd5bdaff731f2=
6f8ca8bc8998ee1e0f39b2" rel=3D"noreferrer" target=3D"_blank">github.com/go-=
openapi/swag/conv;version=3Dv0.25.5;sha256sum=3Dc02fe7118d58720cbd83bc7c0c3=
7edd5bdaff731f26f8ca8bc8998ee1e0f39b2</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/fi=
leutils;version=3Dv0.25.5;sha256sum=3Df368511a4eda5e14680aaa358b0b6fd2ca23c=
fc61aa8bfec234acb51ec9c4561" rel=3D"noreferrer" target=3D"_blank">github.co=
m/go-openapi/swag/fileutils;version=3Dv0.25.5;sha256sum=3Df368511a4eda5e146=
80aaa358b0b6fd2ca23cfc61aa8bfec234acb51ec9c4561</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/js=
onname;version=3Dv0.25.5;sha256sum=3Dfff4d3d3875709813d6fcd5657133de4331eb1=
36a0aedd51a099f7f76605ae08" rel=3D"noreferrer" target=3D"_blank">github.com=
/go-openapi/swag/jsonname;version=3Dv0.25.5;sha256sum=3Dfff4d3d3875709813d6=
fcd5657133de4331eb136a0aedd51a099f7f76605ae08</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/js=
onutils;version=3Dv0.25.5;sha256sum=3D9d6fad8614363682c676c5380433d6f376ddc=
bfe09af5d5b1e92db57eb3f89a6" rel=3D"noreferrer" target=3D"_blank">github.co=
m/go-openapi/swag/jsonutils;version=3Dv0.25.5;sha256sum=3D9d6fad8614363682c=
676c5380433d6f376ddcbfe09af5d5b1e92db57eb3f89a6</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/lo=
ading;version=3Dv0.25.5;sha256sum=3D08db0dfa32b02d4575d202a43c2cbf547b55e1c=
c1700b83b50e2bd6963fe473b" rel=3D"noreferrer" target=3D"_blank">github.com/=
go-openapi/swag/loading;version=3Dv0.25.5;sha256sum=3D08db0dfa32b02d4575d20=
2a43c2cbf547b55e1cc1700b83b50e2bd6963fe473b</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/ma=
ngling;version=3Dv0.25.5;sha256sum=3De18e5bf564ca56e0534593b39c694030a1700c=
cb75d4d9597633310d01c3032f" rel=3D"noreferrer" target=3D"_blank">github.com=
/go-openapi/swag/mangling;version=3Dv0.25.5;sha256sum=3De18e5bf564ca56e0534=
593b39c694030a1700ccb75d4d9597633310d01c3032f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/ne=
tutils;version=3Dv0.25.5;sha256sum=3D7272f9e0ccb481ce99f5189ec73c91fcb5b716=
d3cea7265faa433f78220c09bb" rel=3D"noreferrer" target=3D"_blank">github.com=
/go-openapi/swag/netutils;version=3Dv0.25.5;sha256sum=3D7272f9e0ccb481ce99f=
5189ec73c91fcb5b716d3cea7265faa433f78220c09bb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/st=
ringutils;version=3Dv0.25.5;sha256sum=3D84c67b1424ec75a3c98c4f8403215212dc8=
234a2ca49bfc4cd2948c4c0f474fc" rel=3D"noreferrer" target=3D"_blank">github.=
com/go-openapi/swag/stringutils;version=3Dv0.25.5;sha256sum=3D84c67b1424ec7=
5a3c98c4f8403215212dc8234a2ca49bfc4cd2948c4c0f474fc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/ty=
peutils;version=3Dv0.25.5;sha256sum=3De9561c699417276b878b22967f457f29acc80=
b9ce5f977dc520637dd419f0c4a" rel=3D"noreferrer" target=3D"_blank">github.co=
m/go-openapi/swag/typeutils;version=3Dv0.25.5;sha256sum=3De9561c699417276b8=
78b22967f457f29acc80b9ce5f977dc520637dd419f0c4a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/swag/ya=
mlutils;version=3Dv0.25.5;sha256sum=3Daf4b90aa0549f31d619676f1642fc70b5aeb6=
2a7ae8895a5b0d8225e2d02d09a" rel=3D"noreferrer" target=3D"_blank">github.co=
m/go-openapi/swag/yamlutils;version=3Dv0.25.5;sha256sum=3Daf4b90aa0549f31d6=
19676f1642fc70b5aeb62a7ae8895a5b0d8225e2d02d09a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-openapi/validat=
e;version=3Dv0.25.2;sha256sum=3Dce569ad32c22f253dde70de305edbfe595f7c9c1981=
6636451623b94ac5d9f63" rel=3D"noreferrer" target=3D"_blank">github.com/go-o=
penapi/validate;version=3Dv0.25.2;sha256sum=3Dce569ad32c22f253dde70de305edb=
fe595f7c9c19816636451623b94ac5d9f63</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/go-viper/mapstruct=
ure/v2;version=3Dv2.5.0;sha256sum=3D326f8e00f648af4ae8e6e18c606325e4206a92d=
6ed42f486dc2f4da8e1897547" rel=3D"noreferrer" target=3D"_blank">github.com/=
go-viper/mapstructure/v2;version=3Dv2.5.0;sha256sum=3D326f8e00f648af4ae8e6e=
18c606325e4206a92d6ed42f486dc2f4da8e1897547</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/gobwas/glob;versio=
n=3Dv0.2.3;sha256sum=3D0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff269=
91b4049f4fdf" rel=3D"noreferrer" target=3D"_blank">github.com/gobwas/glob;v=
ersion=3Dv0.2.3;sha256sum=3D0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80=
ff26991b4049f4fdf</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/golang/snappy;vers=
ion=3Dv0.0.4;sha256sum=3Dea4545ca44ee990554094df6de440386a440a5bd99106e0489=
39409d63beb423" rel=3D"noreferrer" target=3D"_blank">github.com/golang/snap=
py;version=3Dv0.0.4;sha256sum=3Dea4545ca44ee990554094df6de440386a440a5bd991=
06e048939409d63beb423</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/golang-jwt/jwt/v4;=
version=3Dv4.5.2;sha256sum=3Dec5ee69a31fd478fc197fddce7c06dad1abe7543095a55=
c4ee6546ae79d99a0f" rel=3D"noreferrer" target=3D"_blank">github.com/golang-=
jwt/jwt/v4;version=3Dv4.5.2;sha256sum=3Dec5ee69a31fd478fc197fddce7c06dad1ab=
e7543095a55c4ee6546ae79d99a0f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/golang-jwt/jwt/v5;=
version=3Dv5.3.0;sha256sum=3D7de1cf03d836b3fcb32e02011d148fe94533e52dd54d52=
1cadc61bcdf068eb1c" rel=3D"noreferrer" target=3D"_blank">github.com/golang-=
jwt/jwt/v5;version=3Dv5.3.0;sha256sum=3D7de1cf03d836b3fcb32e02011d148fe9453=
3e52dd54d521cadc61bcdf068eb1c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/certificate=
-transparency-go;version=3Dv1.3.3;sha256sum=3D2728bdcc12bd62dfa29cbc5211dd4=
e25ca471a806dd0ab2400177a9a45733641" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/google/certificate-transparency-go;version=3Dv1.3.3;sha256sum=3D2=
728bdcc12bd62dfa29cbc5211dd4e25ca471a806dd0ab2400177a9a45733641</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/gnostic-mod=
els;version=3Dv0.7.0;sha256sum=3D797a05cd73a30624ece79633c4db4631676adc1f30=
f07a0a7051ab39beca96c8" rel=3D"noreferrer" target=3D"_blank">github.com/goo=
gle/gnostic-models;version=3Dv0.7.0;sha256sum=3D797a05cd73a30624ece79633c4d=
b4631676adc1f30f07a0a7051ab39beca96c8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/go-cmp;vers=
ion=3Dv0.7.0;sha256sum=3D64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f=
7630919db3f539" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-c=
mp;version=3Dv0.7.0;sha256sum=3D64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b=
67bf27f7630919db3f539</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/go-containe=
rregistry;version=3Dv0.21.3;sha256sum=3D860ac1d37ac6ace9401e28e7292cebfd942=
5ea171f1f02c298369665c46b6de9" rel=3D"noreferrer" target=3D"_blank">github.=
com/google/go-containerregistry;version=3Dv0.21.3;sha256sum=3D860ac1d37ac6a=
ce9401e28e7292cebfd9425ea171f1f02c298369665c46b6de9</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/go-github/v=
73;version=3Dv73.0.0;sha256sum=3D82da258d807e9be4bc3993e3909577de3ec3b676e8=
3ee6f28a9a1aef7a46137d" rel=3D"noreferrer" target=3D"_blank">github.com/goo=
gle/go-github/v73;version=3Dv73.0.0;sha256sum=3D82da258d807e9be4bc3993e3909=
577de3ec3b676e83ee6f28a9a1aef7a46137d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/go-querystr=
ing;version=3Dv1.2.0;sha256sum=3D57b7ce2b82b33c68f59a224c6dd1305753e5ee3eec=
befd09d43423a14f541e31" rel=3D"noreferrer" target=3D"_blank">github.com/goo=
gle/go-querystring;version=3Dv1.2.0;sha256sum=3D57b7ce2b82b33c68f59a224c6dd=
1305753e5ee3eecbefd09d43423a14f541e31</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/s2a-go;vers=
ion=3Dv0.1.9;sha256sum=3Dbf8f4b159d3fc201477822ed2514e4f05f58c764b78ffed73e=
c0accce5fb7f07" rel=3D"noreferrer" target=3D"_blank">github.com/google/s2a-=
go;version=3Dv0.1.9;sha256sum=3Dbf8f4b159d3fc201477822ed2514e4f05f58c764b78=
ffed73ec0accce5fb7f07</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/google/uuid;versio=
n=3Dv1.6.0;sha256sum=3Dd0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea=
56038b38a6ed" rel=3D"noreferrer" target=3D"_blank">github.com/google/uuid;v=
ersion=3Dv1.6.0;sha256sum=3Dd0f02f377217f42702e259684e06441edbf5140dddcc34b=
a9bea56038b38a6ed</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/googleapis/enterpr=
ise-certificate-proxy;version=3Dv0.3.12;sha256sum=3D5e0f2acd75886d11b2cea99=
03e908af8fddd64cf9a53a9bf40a48e8ff30f4a96" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/googleapis/enterprise-certificate-proxy;version=3Dv0.3.12;s=
ha256sum=3D5e0f2acd75886d11b2cea9903e908af8fddd64cf9a53a9bf40a48e8ff30f4a96=
</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/googleapis/gax-go/=
v2;version=3Dv2.17.0;sha256sum=3D7621672828461256b38091fefcf55056940c910188=
d51240874fd7e6f8432e93" rel=3D"noreferrer" target=3D"_blank">github.com/goo=
gleapis/gax-go/v2;version=3Dv2.17.0;sha256sum=3D7621672828461256b38091fefcf=
55056940c910188d51240874fd7e6f8432e93</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/grpc-ecosystem/grp=
c-gateway/v2;version=3Dv2.27.7;sha256sum=3Dcf582c8973dab45fed618da990044ac0=
4893d038694fe4e6bddd3dc44641fef4" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/grpc-ecosystem/grpc-gateway/v2;version=3Dv2.27.7;sha256sum=3Dcf582c8=
973dab45fed618da990044ac04893d038694fe4e6bddd3dc44641fef4</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/errwrap;=
version=3Dv1.1.0;sha256sum=3D209ae99bc039443e28e4d6bb66517d1756d9468b7578d3=
1f1b63a28103d8e18c" rel=3D"noreferrer" target=3D"_blank">github.com/hashico=
rp/errwrap;version=3Dv1.1.0;sha256sum=3D209ae99bc039443e28e4d6bb66517d1756d=
9468b7578d31f1b63a28103d8e18c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-clean=
http;version=3Dv0.5.2;sha256sum=3De9f3dcfcb33172ba499b4f8e888169252d7f1e072=
082182124a6e2053523f7df" rel=3D"noreferrer" target=3D"_blank">github.com/ha=
shicorp/go-cleanhttp;version=3Dv0.5.2;sha256sum=3De9f3dcfcb33172ba499b4f8e8=
88169252d7f1e072082182124a6e2053523f7df</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-multi=
error;version=3Dv1.1.1;sha256sum=3D972cd841ee51fdeac69c5a301e57f8ea27aebf15=
fddd7f621d5c240f28c3000c" rel=3D"noreferrer" target=3D"_blank">github.com/h=
ashicorp/go-multierror;version=3Dv1.1.1;sha256sum=3D972cd841ee51fdeac69c5a3=
01e57f8ea27aebf15fddd7f621d5c240f28c3000c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-retry=
ablehttp;version=3Dv0.7.8;sha256sum=3D9e2c175e4af37cdfeba28ed89250ad1fd691e=
da0fab167fafa9928222646b71e" rel=3D"noreferrer" target=3D"_blank">github.co=
m/hashicorp/go-retryablehttp;version=3Dv0.7.8;sha256sum=3D9e2c175e4af37cdfe=
ba28ed89250ad1fd691eda0fab167fafa9928222646b71e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-rootc=
erts;version=3Dv1.0.2;sha256sum=3D864a48e642e87a273fb5ef60bb3575bd74a709051=
0f93143163fa6700be31948" rel=3D"noreferrer" target=3D"_blank">github.com/ha=
shicorp/go-rootcerts;version=3Dv1.0.2;sha256sum=3D864a48e642e87a273fb5ef60b=
b3575bd74a7090510f93143163fa6700be31948</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-secur=
e-stdlib/parseutil;version=3Dv0.2.0;sha256sum=3D715aecec5d925467704774d3ab4=
bd3c4eead5ddb525a4bceb06c6f1e697ddba8" rel=3D"noreferrer" target=3D"_blank"=
>github.com/hashicorp/go-secure-stdlib/parseutil;version=3Dv0.2.0;sha256sum=
=3D715aecec5d925467704774d3ab4bd3c4eead5ddb525a4bceb06c6f1e697ddba8</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-secur=
e-stdlib/strutil;version=3Dv0.1.2;sha256sum=3D8070c67bc97e15488b99b172ddb66=
31412dca0fcb8cea90e37fe55d95e1af00a" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/hashicorp/go-secure-stdlib/strutil;version=3Dv0.1.2;sha256sum=3D8=
070c67bc97e15488b99b172ddb6631412dca0fcb8cea90e37fe55d95e1af00a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/go-socka=
ddr;version=3Dv1.0.7;sha256sum=3D53ea8d77b68056fe7f40a53338aa73ed6ddca9558f=
e1156804070a060f1a930f" rel=3D"noreferrer" target=3D"_blank">github.com/has=
hicorp/go-sockaddr;version=3Dv1.0.7;sha256sum=3D53ea8d77b68056fe7f40a53338a=
a73ed6ddca9558fe1156804070a060f1a930f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/hcl;vers=
ion=3Dv1.0.1-vault-7;sha256sum=3D84fea514e70253c65e3caf90a8d9f366808bdfb409=
9914d1e6ab0d1fdba976b7" rel=3D"noreferrer" target=3D"_blank">github.com/has=
hicorp/hcl;version=3Dv1.0.1-vault-7;sha256sum=3D84fea514e70253c65e3caf90a8d=
9f366808bdfb4099914d1e6ab0d1fdba976b7</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/hashicorp/vault/ap=
i;version=3Dv1.22.0;sha256sum=3Dca415b5364f49dadb17be1bc60f156c9f5cd6579a2e=
0711b069b3418c3a2265e" rel=3D"noreferrer" target=3D"_blank">github.com/hash=
icorp/vault/api;version=3Dv1.22.0;sha256sum=3Dca415b5364f49dadb17be1bc60f15=
6c9f5cd6579a2e0711b069b3418c3a2265e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/in-toto/attestatio=
n;version=3Dv1.1.2;sha256sum=3D0bb737ac0836f6a9ba6499139630a558bdda510c78dc=
51967e58355006a03d9a" rel=3D"noreferrer" target=3D"_blank">github.com/in-to=
to/attestation;version=3Dv1.1.2;sha256sum=3D0bb737ac0836f6a9ba6499139630a55=
8bdda510c78dc51967e58355006a03d9a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/in-toto/in-toto-go=
lang;version=3Dv0.10.0;sha256sum=3D714134f015027dc9d65e55de7625d06ed3f91cc3=
888a84480a6110e14e952709" rel=3D"noreferrer" target=3D"_blank">github.com/i=
n-toto/in-toto-golang;version=3Dv0.10.0;sha256sum=3D714134f015027dc9d65e55d=
e7625d06ed3f91cc3888a84480a6110e14e952709</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/jedisct1/go-minisi=
gn;version=3Dv0.0.0-20230811132847-661be99b8267;sha256sum=3D5c8c88dd60cd9c2=
214a38f5ce42d39c05aafb58a92909c2bc1f49e430d59b1d5" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/jedisct1/go-minisign;version=3Dv0.0.0-2023081113284=
7-661be99b8267;sha256sum=3D5c8c88dd60cd9c2214a38f5ce42d39c05aafb58a92909c2b=
c1f49e430d59b1d5</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/jellydator/ttlcach=
e/v3;version=3Dv3.4.0;sha256sum=3Db3f31d5c4ea68698f1de6f85dbaacb176b2fadeaa=
6d426a38f48f4f752f974fb" rel=3D"noreferrer" target=3D"_blank">github.com/je=
llydator/ttlcache/v3;version=3Dv3.4.0;sha256sum=3Db3f31d5c4ea68698f1de6f85d=
baacb176b2fadeaa6d426a38f48f4f752f974fb</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/json-iterator/go;v=
ersion=3Dv1.1.12;sha256sum=3Dd001ea57081afd0e378467c8f4a9b6a51259996bb8bb76=
3f78107eaf12f99501" rel=3D"noreferrer" target=3D"_blank">github.com/json-it=
erator/go;version=3Dv1.1.12;sha256sum=3Dd001ea57081afd0e378467c8f4a9b6a5125=
9996bb8bb763f78107eaf12f99501</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/klauspost/compress=
;version=3Dv1.18.4;sha256sum=3Da295e4443ad6c88d8f5b8690807f413800fa171571d3=
a5970e2abefe6fe6e990" rel=3D"noreferrer" target=3D"_blank">github.com/klaus=
post/compress;version=3Dv1.18.4;sha256sum=3Da295e4443ad6c88d8f5b8690807f413=
800fa171571d3a5970e2abefe6fe6e990</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/kylelemons/godebug=
;version=3Dv1.1.0;sha256sum=3Ddbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4=
798dbf10a487a2b6d13" rel=3D"noreferrer" target=3D"_blank">github.com/kylele=
mons/godebug;version=3Dv1.1.0;sha256sum=3Ddbbd0ce8c2f4932bb03704d73026b21af=
12bd68d5b8f4798dbf10a487a2b6d13</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/blackm=
agic;version=3Dv1.0.4;sha256sum=3D4775ca8eab443a882cc1772c25716810a889d4787=
46c6a405f559750de42dce6" rel=3D"noreferrer" target=3D"_blank">github.com/le=
strrat-go/blackmagic;version=3Dv1.0.4;sha256sum=3D4775ca8eab443a882cc1772c2=
5716810a889d478746c6a405f559750de42dce6</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/dsig;v=
ersion=3Dv1.0.0;sha256sum=3Dd4f31e5380752d00740a447b7c129dfb2644367e4642e35=
ad60ff252edb470a0" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat=
-go/dsig;version=3Dv1.0.0;sha256sum=3Dd4f31e5380752d00740a447b7c129dfb26443=
67e4642e35ad60ff252edb470a0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/httpcc=
;version=3Dv1.0.1;sha256sum=3Dd75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28=
e2a22b8fd2e029a3f4c" rel=3D"noreferrer" target=3D"_blank">github.com/lestrr=
at-go/httpcc;version=3Dv1.0.1;sha256sum=3Dd75132f805ea5cf6275d9af02a5ff3c11=
6ad92ac7fc28e2a22b8fd2e029a3f4c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/httprc=
/v3;version=3Dv3.0.2;sha256sum=3D188f9e9b9fdebde5fd6196a6cdc1b5a3a0f9b4c9a8=
2cb146cfbb5b600a6a5094" rel=3D"noreferrer" target=3D"_blank">github.com/les=
trrat-go/httprc/v3;version=3Dv3.0.2;sha256sum=3D188f9e9b9fdebde5fd6196a6cdc=
1b5a3a0f9b4c9a82cb146cfbb5b600a6a5094</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/jwx/v3=
;version=3Dv3.0.13;sha256sum=3Df1ee98b4f90c79eecfce10e995ecd0a538224e853293=
814c41ffa13947ad407a" rel=3D"noreferrer" target=3D"_blank">github.com/lestr=
rat-go/jwx/v3;version=3Dv3.0.13;sha256sum=3Df1ee98b4f90c79eecfce10e995ecd0a=
538224e853293814c41ffa13947ad407a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/lestrrat-go/option=
/v2;version=3Dv2.0.0;sha256sum=3D3456bd01638c67da62570123f3d12f5996d0a01ed5=
21959c2fc85aa83d3ee94a" rel=3D"noreferrer" target=3D"_blank">github.com/les=
trrat-go/option/v2;version=3Dv2.0.0;sha256sum=3D3456bd01638c67da62570123f3d=
12f5996d0a01ed521959c2fc85aa83d3ee94a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/letsencrypt/boulde=
r;version=3Dv0.20260223.0;sha256sum=3Df9a88ba61b0c561c2570b9df5e6d788262fbf=
197d3d90cede64a321fae9a899d" rel=3D"noreferrer" target=3D"_blank">github.co=
m/letsencrypt/boulder;version=3Dv0.20260223.0;sha256sum=3Df9a88ba61b0c561c2=
570b9df5e6d788262fbf197d3d90cede64a321fae9a899d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mitchellh/go-homed=
ir;version=3Dv1.1.0;sha256sum=3Dfffec361fc7e776bb71433560c285ee2982d2c140b8=
f5bfba0db6033c0ade184" rel=3D"noreferrer" target=3D"_blank">github.com/mitc=
hellh/go-homedir;version=3Dv1.1.0;sha256sum=3Dfffec361fc7e776bb71433560c285=
ee2982d2c140b8f5bfba0db6033c0ade184</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mitchellh/go-wordw=
rap;version=3Dv1.0.1;sha256sum=3D5f96426c4b3b3e90a9b7471568cb1d61d6a306744f=
5d4765a30fa8a61e1c0b47" rel=3D"noreferrer" target=3D"_blank">github.com/mit=
chellh/go-wordwrap;version=3Dv1.0.1;sha256sum=3D5f96426c4b3b3e90a9b7471568c=
b1d61d6a306744f5d4765a30fa8a61e1c0b47</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mitchellh/mapstruc=
ture;version=3Dv1.5.1-0.20231216201459-8508981c8b6c;sha256sum=3D1cc37cf0bb7=
849d0fb29daabe5597450c565e334564ed28eabf3f0602259733b" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/mitchellh/mapstructure;version=3Dv1.5.1-0.20231=
216201459-8508981c8b6c;sha256sum=3D1cc37cf0bb7849d0fb29daabe5597450c565e334=
564ed28eabf3f0602259733b</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/moby/term;version=
=3Dv0.5.2;sha256sum=3Df8d6e5c53992c640512ee45a9b6147a765bebe3d8d50e3bfe1e4e=
c3e052cd688" rel=3D"noreferrer" target=3D"_blank">github.com/moby/term;vers=
ion=3Dv0.5.2;sha256sum=3Df8d6e5c53992c640512ee45a9b6147a765bebe3d8d50e3bfe1=
e4ec3e052cd688</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/modern-go/concurre=
nt;version=3Dv0.0.0-20180306012644-bacd9c7ef1dd;sha256sum=3D91ef49599bec459=
869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4a8073" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/modern-go/concurrent;version=3Dv0.0.0-2018030601264=
4-bacd9c7ef1dd;sha256sum=3D91ef49599bec459869d94ff3dec128871ab66bd2dfa61041=
f1e1169f9b4a8073</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/modern-go/reflect2=
;version=3Dv1.0.3-0.20250322232337-35a7c28c31ee;sha256sum=3D49f3fb0f76b1b98=
b52b5e6e8eab2a48454eab33904b937625941c28138a7fea4" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/modern-go/reflect2;version=3Dv1.0.3-0.2025032223233=
7-35a7c28c31ee;sha256sum=3D49f3fb0f76b1b98b52b5e6e8eab2a48454eab33904b93762=
5941c28138a7fea4</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mozillazg/docker-c=
redential-acr-helper;version=3Dv0.4.0;sha256sum=3De696b388bfc8b0a557722ccdc=
d3c002657daaaaf6aea07349145dc6e42dd463a" rel=3D"noreferrer" target=3D"_blan=
k">github.com/mozillazg/docker-credential-acr-helper;version=3Dv0.4.0;sha25=
6sum=3De696b388bfc8b0a557722ccdcd3c002657daaaaf6aea07349145dc6e42dd463a</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/munnerz/goautoneg;=
version=3Dv0.0.0-20191010083416-a7dc8b61c822;sha256sum=3D3d7ce17916779890be=
02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9" rel=3D"noreferrer" target=
=3D"_blank">github.com/munnerz/goautoneg;version=3Dv0.0.0-20191010083416-a7=
dc8b61c822;sha256sum=3D3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9=
b310e636afd9</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/natefinch/atomic;v=
ersion=3Dv1.0.1;sha256sum=3D25df4a9727bd8750557a848d9066503c2e0b1788821be4d=
b87377fd202254ed4" rel=3D"noreferrer" target=3D"_blank">github.com/natefinc=
h/atomic;version=3Dv1.0.1;sha256sum=3D25df4a9727bd8750557a848d9066503c2e0b1=
788821be4db87377fd202254ed4</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/nozzle/throttler;v=
ersion=3Dv0.0.0-20180817012639-2ea982251481;sha256sum=3D660c8605727fc99ef3c=
71706592138b59cc6cd4d63be978b2371887626499b75" rel=3D"noreferrer" target=3D=
"_blank">github.com/nozzle/throttler;version=3Dv0.0.0-20180817012639-2ea982=
251481;sha256sum=3D660c8605727fc99ef3c71706592138b59cc6cd4d63be978b23718876=
26499b75</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/oklog/ulid/v2;vers=
ion=3Dv2.1.1;sha256sum=3D312b5fea3f68df920adaffc327440efbaba43ad6a8df2f7e0c=
9e365743f6ff89" rel=3D"noreferrer" target=3D"_blank">github.com/oklog/ulid/=
v2;version=3Dv2.1.1;sha256sum=3D312b5fea3f68df920adaffc327440efbaba43ad6a8d=
f2f7e0c9e365743f6ff89</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/oleiade/reflection=
s;version=3Dv1.1.0;sha256sum=3Df8e70604f64ac56c843f2b5f7d97546d23a94db198f0=
31c0d23962c4d2b8bce5" rel=3D"noreferrer" target=3D"_blank">github.com/oleia=
de/reflections;version=3Dv1.1.0;sha256sum=3Df8e70604f64ac56c843f2b5f7d97546=
d23a94db198f031c0d23962c4d2b8bce5</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/open-policy-agent/=
opa;version=3Dv1.14.1;sha256sum=3D6755ebebbd9106de9fc4159d3655986c4030e3397=
168f8cff23f7b3eee6975e1" rel=3D"noreferrer" target=3D"_blank">github.com/op=
en-policy-agent/opa;version=3Dv1.14.1;sha256sum=3D6755ebebbd9106de9fc4159d3=
655986c4030e3397168f8cff23f7b3eee6975e1</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/opencontainers/go-=
digest;version=3Dv1.0.0;sha256sum=3D615efb31ff6cd71035b8aa38c3659d8b4da46f3=
cd92ac807cb50449adfe37c86" rel=3D"noreferrer" target=3D"_blank">github.com/=
opencontainers/go-digest;version=3Dv1.0.0;sha256sum=3D615efb31ff6cd71035b8a=
a38c3659d8b4da46f3cd92ac807cb50449adfe37c86</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/opencontainers/ima=
ge-spec;version=3Dv1.1.1;sha256sum=3D3a32eeb459719172947c20be78b5b7293c6ea8=
4f4039184e846f6b676bc19574" rel=3D"noreferrer" target=3D"_blank">github.com=
/opencontainers/image-spec;version=3Dv1.1.1;sha256sum=3D3a32eeb459719172947=
c20be78b5b7293c6ea84f4039184e846f6b676bc19574</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pborman/uuid;versi=
on=3Dv1.2.1;sha256sum=3D3699aef3b9e0a97863a4a90bf26254d1a6ba03a2b1d4f4d2a50=
61c4d29d9dd7f" rel=3D"noreferrer" target=3D"_blank">github.com/pborman/uuid=
;version=3Dv1.2.1;sha256sum=3D3699aef3b9e0a97863a4a90bf26254d1a6ba03a2b1d4f=
4d2a5061c4d29d9dd7f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pelletier/go-toml/=
v2;version=3Dv2.2.4;sha256sum=3D82162be7b85077f3be49bfe0f1e01f308b9c9554c72=
a980a22a34432f94885f0" rel=3D"noreferrer" target=3D"_blank">github.com/pell=
etier/go-toml/v2;version=3Dv2.2.4;sha256sum=3D82162be7b85077f3be49bfe0f1e01=
f308b9c9554c72a980a22a34432f94885f0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pkg/browser;versio=
n=3Dv0.0.0-20240102092130-5ac0b6a4141c;sha256sum=3D8524ae36d809564d1f218978=
593b5c565cf3ee8dccd035d66b336ad0c56e60d1" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/pkg/browser;version=3Dv0.0.0-20240102092130-5ac0b6a4141c;sha=
256sum=3D8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1</=
a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pkg/errors;version=
=3Dv0.9.1;sha256sum=3Dd4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df=
1b44af2bd07" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors;ver=
sion=3Dv0.9.1;sha256sum=3Dd4c36b8bcd0616290a3913215e0f53b931bd6e00670596f29=
60df1b44af2bd07</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/protocolbuffers/tx=
tpbfmt;version=3Dv0.0.0-20260217160748-a481f6a22f94;sha256sum=3De184542ac96=
a60f21efe61a5f71f1a14636e46449ea3a445108adb247ddbb019" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/protocolbuffers/txtpbfmt;version=3Dv0.0.0-20260=
217160748-a481f6a22f94;sha256sum=3De184542ac96a60f21efe61a5f71f1a14636e4644=
9ea3a445108adb247ddbb019</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/rcrowley/go-metric=
s;version=3Dv0.0.0-20250401214520-65e299d6c5c9;sha256sum=3Da8c9e9792ad16f31=
ef8c32232de6243cc02147175661c9f64bc7b292f1c4d0cc" rel=3D"noreferrer" target=
=3D"_blank">github.com/rcrowley/go-metrics;version=3Dv0.0.0-20250401214520-=
65e299d6c5c9;sha256sum=3Da8c9e9792ad16f31ef8c32232de6243cc02147175661c9f64b=
c7b292f1c4d0cc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/rogpeppe/go-intern=
al;version=3Dv1.14.1;sha256sum=3Dab3d18283cef2f46ddfd489b6b14b970eb7dbbb642=
786f025ee1ac5291dc4e70" rel=3D"noreferrer" target=3D"_blank">github.com/rog=
peppe/go-internal;version=3Dv1.14.1;sha256sum=3Dab3d18283cef2f46ddfd489b6b1=
4b970eb7dbbb642786f025ee1ac5291dc4e70</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/ryanuber/go-glob;v=
ersion=3Dv1.0.0;sha256sum=3D2084f36ead38a505489fdb46329502fb627f568224dcc22=
ef11ec173b61fc2cf" rel=3D"noreferrer" target=3D"_blank">github.com/ryanuber=
/go-glob;version=3Dv1.0.0;sha256sum=3D2084f36ead38a505489fdb46329502fb627f5=
68224dcc22ef11ec173b61fc2cf</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sagikazarmark/loca=
fero;version=3Dv0.11.0;sha256sum=3D6c2a9bdf9567f63caebf47694d94acd4350b1d4d=
69f13c3188f4e7e82939f6a5" rel=3D"noreferrer" target=3D"_blank">github.com/s=
agikazarmark/locafero;version=3Dv0.11.0;sha256sum=3D6c2a9bdf9567f63caebf476=
94d94acd4350b1d4d69f13c3188f4e7e82939f6a5</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sassoftware/relic;=
version=3Dv7.2.1+incompatible;sha256sum=3Dc28fccce743db96510662f1d45f8a4b22=
12f5f60fb4a4f31a99261118ed068f3" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/sassoftware/relic;version=3Dv7.2.1+incompatible;sha256sum=3Dc28fccce7=
43db96510662f1d45f8a4b2212f5f60fb4a4f31a99261118ed068f3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/secure-systems-lab=
/go-securesystemslib;version=3Dv0.10.0;sha256sum=3D399f400aa66b243ebd24215a=
78041cdb7dd0a47ac74e0068898dcf33428d8bc3" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/secure-systems-lab/go-securesystemslib;version=3Dv0.10.0;sha=
256sum=3D399f400aa66b243ebd24215a78041cdb7dd0a47ac74e0068898dcf33428d8bc3</=
a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/shibumi/go-pathspe=
c;version=3Dv1.3.0;sha256sum=3D1ac9091ebe9ff4154ddc39b2b3436c5b6b268d5cdc1e=
8462c9790485cd76a58f" rel=3D"noreferrer" target=3D"_blank">github.com/shibu=
mi/go-pathspec;version=3Dv1.3.0;sha256sum=3D1ac9091ebe9ff4154ddc39b2b3436c5=
b6b268d5cdc1e8462c9790485cd76a58f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/fulcio;ve=
rsion=3Dv1.8.5;sha256sum=3Dd755a957ed769650216da2e3c2905c45434673b00c4510a5=
63d6620b30a305df" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/=
fulcio;version=3Dv1.8.5;sha256sum=3Dd755a957ed769650216da2e3c2905c45434673b=
00c4510a563d6620b30a305df</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/protobuf-=
specs;version=3Dv0.5.0;sha256sum=3D0eb8b14e1e4392ee93e6ab48fabea3f59d42cdf8=
7e62111384c5d2cc02e1639f" rel=3D"noreferrer" target=3D"_blank">github.com/s=
igstore/protobuf-specs;version=3Dv0.5.0;sha256sum=3D0eb8b14e1e4392ee93e6ab4=
8fabea3f59d42cdf87e62111384c5d2cc02e1639f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/rekor;ver=
sion=3Dv1.5.1;sha256sum=3Df3b55a07b7d6f2ce17c26d1840a6e0b28875bb5ca28b9fcd3=
ecd4f3f53be9051" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/r=
ekor;version=3Dv1.5.1;sha256sum=3Df3b55a07b7d6f2ce17c26d1840a6e0b28875bb5ca=
28b9fcd3ecd4f3f53be9051</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/rekor-til=
es/v2;version=3Dv2.2.1;sha256sum=3Dd14bbde50827e92ee018c5aa28da7ace0225f6e0=
f557de01d81241d49ebf9905" rel=3D"noreferrer" target=3D"_blank">github.com/s=
igstore/rekor-tiles/v2;version=3Dv2.2.1;sha256sum=3Dd14bbde50827e92ee018c5a=
a28da7ace0225f6e0f557de01d81241d49ebf9905</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore;=
version=3Dv1.10.5;sha256sum=3D335a90c44640d20cf6dcf078cc3e540300cbcf4dff634=
bea2703b2b74d25c1c4" rel=3D"noreferrer" target=3D"_blank">github.com/sigsto=
re/sigstore;version=3Dv1.10.5;sha256sum=3D335a90c44640d20cf6dcf078cc3e54030=
0cbcf4dff634bea2703b2b74d25c1c4</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore/=
pkg/signature/kms/aws;version=3Dv1.10.5;sha256sum=3D62fb728a5bf10ba130912f4=
3bff29f1ce2ddbe66833092aec4edb39dbf08ee99" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/sigstore/sigstore/pkg/signature/kms/aws;version=3Dv1.10.5;s=
ha256sum=3D62fb728a5bf10ba130912f43bff29f1ce2ddbe66833092aec4edb39dbf08ee99=
</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore/=
pkg/signature/kms/azure;version=3Dv1.10.5;sha256sum=3D7eb73ecc729016cecb9b7=
6f32c0ff39c9a7b3f72c3060fa04e119d303c84c038" rel=3D"noreferrer" target=3D"_=
blank">github.com/sigstore/sigstore/pkg/signature/kms/azure;version=3Dv1.10=
.5;sha256sum=3D7eb73ecc729016cecb9b76f32c0ff39c9a7b3f72c3060fa04e119d303c84=
c038</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore/=
pkg/signature/kms/gcp;version=3Dv1.10.5;sha256sum=3Dda6b2511b40125d34d7bf46=
a94698ef9601a120bd569fca6a6ad4c2b328e0456" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/sigstore/sigstore/pkg/signature/kms/gcp;version=3Dv1.10.5;s=
ha256sum=3Dda6b2511b40125d34d7bf46a94698ef9601a120bd569fca6a6ad4c2b328e0456=
</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore/=
pkg/signature/kms/hashivault;version=3Dv1.10.5;sha256sum=3D13172983962f0d3f=
d0d56bee830456cd2c2584b0742d1b8efef14b4641e51956" rel=3D"noreferrer" target=
=3D"_blank">github.com/sigstore/sigstore/pkg/signature/kms/hashivault;versi=
on=3Dv1.10.5;sha256sum=3D13172983962f0d3fd0d56bee830456cd2c2584b0742d1b8efe=
f14b4641e51956</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/sigstore-=
go;version=3Dv1.1.4;sha256sum=3D809fa597f98fcec826efcfdb1ac1376e25903adcccd=
ae356b43b13af10895698" rel=3D"noreferrer" target=3D"_blank">github.com/sigs=
tore/sigstore-go;version=3Dv1.1.4;sha256sum=3D809fa597f98fcec826efcfdb1ac13=
76e25903adcccdae356b43b13af10895698</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sigstore/timestamp=
-authority/v2;version=3Dv2.0.5;sha256sum=3D61cb8c7c183c7ae5d5bdf145021f5b09=
0f0f43f92e8f69626d0bac1bb6a7155c" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/sigstore/timestamp-authority/v2;version=3Dv2.0.5;sha256sum=3D61cb8c7=
c183c7ae5d5bdf145021f5b090f0f43f92e8f69626d0bac1bb6a7155c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sirupsen/logrus;ve=
rsion=3Dv1.9.4;sha256sum=3D3847d00c5ee6948f1ff0d0120bc343c55ce852becb7720f8=
f08f53eecfe9e437" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/=
logrus;version=3Dv1.9.4;sha256sum=3D3847d00c5ee6948f1ff0d0120bc343c55ce852b=
ecb7720f8f08f53eecfe9e437</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/sourcegraph/conc;v=
ersion=3Dv0.3.1-0.20240121214520-5f936abd7ae8;sha256sum=3D6db56fe285f78ba99=
4a77d676d790b1db85a47cc8948a42d4c2f6ca6200b9413" rel=3D"noreferrer" target=
=3D"_blank">github.com/sourcegraph/conc;version=3Dv0.3.1-0.20240121214520-5=
f936abd7ae8;sha256sum=3D6db56fe285f78ba994a77d676d790b1db85a47cc8948a42d4c2=
f6ca6200b9413</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/afero;versio=
n=3Dv1.15.0;sha256sum=3Dd03a0bbce87eeaa1c23f0c0276707bb2d59f46efee875d7d7f1=
d570201be6e1f" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/afero;=
version=3Dv1.15.0;sha256sum=3Dd03a0bbce87eeaa1c23f0c0276707bb2d59f46efee875=
d7d7f1d570201be6e1f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/cast;version=
=3Dv1.10.0;sha256sum=3D7c7ba27f9979ada980c2a69f6b2fdf7b4ce1f2b766e245c0a471=
6f546ad7ddce" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cast;ve=
rsion=3Dv1.10.0;sha256sum=3D7c7ba27f9979ada980c2a69f6b2fdf7b4ce1f2b766e245c=
0a4716f546ad7ddce</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/cobra;versio=
n=3Dv1.10.2;sha256sum=3Da00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db=
15aff5e26872d" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra;=
version=3Dv1.10.2;sha256sum=3Da00aae6fcd631e0fde52c98604452ff70e1b73c3b8a56=
0d68db15aff5e26872d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/pflag;versio=
n=3Dv1.0.10;sha256sum=3Da246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4fa0c6d=
a43edd12de4ca" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/pflag;=
version=3Dv1.0.10;sha256sum=3Da246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4=
fa0c6da43edd12de4ca</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/viper;versio=
n=3Dv1.21.0;sha256sum=3D4096e4ccdbb74027c49f0dfede6d67193053b0d1c1ecce57543=
cf3dacc7b249e" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/viper;=
version=3Dv1.21.0;sha256sum=3D4096e4ccdbb74027c49f0dfede6d67193053b0d1c1ecc=
e57543cf3dacc7b249e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spiffe/go-spiffe/v=
2;version=3Dv2.6.0;sha256sum=3Db90f378c70e2c985f61893ca20bf3e8258bb4f66920a=
f759276d330513d0d7d6" rel=3D"noreferrer" target=3D"_blank">github.com/spiff=
e/go-spiffe/v2;version=3Dv2.6.0;sha256sum=3Db90f378c70e2c985f61893ca20bf3e8=
258bb4f66920af759276d330513d0d7d6</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/subosito/gotenv;ve=
rsion=3Dv1.6.0;sha256sum=3D142db3dd2328e744c157e85cf3291d027013b79f92a45984=
f860fe38bc0f1f8d" rel=3D"noreferrer" target=3D"_blank">github.com/subosito/=
gotenv;version=3Dv1.6.0;sha256sum=3D142db3dd2328e744c157e85cf3291d027013b79=
f92a45984f860fe38bc0f1f8d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/syndtr/goleveldb;v=
ersion=3Dv1.0.1-0.20220721030215-126854af5e6d;sha256sum=3D68a0e0b2969ac85b5=
91fa083b202852bf0eb8a60b303581a4bd68bc0b69d77d8" rel=3D"noreferrer" target=
=3D"_blank">github.com/syndtr/goleveldb;version=3Dv1.0.1-0.20220721030215-1=
26854af5e6d;sha256sum=3D68a0e0b2969ac85b591fa083b202852bf0eb8a60b303581a4bd=
68bc0b69d77d8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/tchap/go-patricia/=
v2;version=3Dv2.3.3;sha256sum=3D37591393b0ea113849eacbc292886ea6978798a5961=
64510c5834c2edc374067" rel=3D"noreferrer" target=3D"_blank">github.com/tcha=
p/go-patricia/v2;version=3Dv2.3.3;sha256sum=3D37591393b0ea113849eacbc292886=
ea6978798a596164510c5834c2edc374067</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/theupdateframework=
/go-tuf;version=3Dv0.7.0;sha256sum=3D5c2c631a720e3c4225cfff085bd080acabd430=
8d0e4e6244e4cc180e019b8eaa" rel=3D"noreferrer" target=3D"_blank">github.com=
/theupdateframework/go-tuf;version=3Dv0.7.0;sha256sum=3D5c2c631a720e3c4225c=
fff085bd080acabd4308d0e4e6244e4cc180e019b8eaa</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/theupdateframework=
/go-tuf/v2;version=3Dv2.4.1;sha256sum=3D1cb913a4229e1b64c95b08a786682125683=
3f70ee3e316f7cdf82cc4ddc9267a" rel=3D"noreferrer" target=3D"_blank">github.=
com/theupdateframework/go-tuf/v2;version=3Dv2.4.1;sha256sum=3D1cb913a4229e1=
b64c95b08a7866821256833f70ee3e316f7cdf82cc4ddc9267a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/titanous/rocacheck=
;version=3Dv0.0.0-20171023193734-afe73141d399;sha256sum=3D00e4f6d7d6a6a4245=
39afb3968c2c9cfd9b42eca089015d67e90358b91e7f8da" rel=3D"noreferrer" target=
=3D"_blank">github.com/titanous/rocacheck;version=3Dv0.0.0-20171023193734-a=
fe73141d399;sha256sum=3D00e4f6d7d6a6a424539afb3968c2c9cfd9b42eca089015d67e9=
0358b91e7f8da</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/tjfoc/gmsm;version=
=3Dv1.4.1;sha256sum=3Dba1f3ccf698a62bcb28c594d995f21587021ad759e777aa64367c=
8a7332cc10b" rel=3D"noreferrer" target=3D"_blank">github.com/tjfoc/gmsm;ver=
sion=3Dv1.4.1;sha256sum=3Dba1f3ccf698a62bcb28c594d995f21587021ad759e777aa64=
367c8a7332cc10b</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/transparency-dev/f=
ormats;version=3Dv0.0.0-20251017110053-404c0d5b696c;sha256sum=3Dff992fe96b2=
60806864ad3557958852990d2b3d0d7e796887db7a9e596613dcc" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/transparency-dev/formats;version=3Dv0.0.0-20251=
017110053-404c0d5b696c;sha256sum=3Dff992fe96b260806864ad3557958852990d2b3d0=
d7e796887db7a9e596613dcc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/transparency-dev/m=
erkle;version=3Dv0.0.2;sha256sum=3Dbff8072eb052d166df4f8f3d144451ca83b98f1c=
0382995167008c44abc383fd" rel=3D"noreferrer" target=3D"_blank">github.com/t=
ransparency-dev/merkle;version=3Dv0.0.2;sha256sum=3Dbff8072eb052d166df4f8f3=
d144451ca83b98f1c0382995167008c44abc383fd</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/valyala/fastjson;v=
ersion=3Dv1.6.7;sha256sum=3D4cbfe712a23a581db9b0eb5e1929fb8da82586e90f3d594=
dc60b508207047b63" rel=3D"noreferrer" target=3D"_blank">github.com/valyala/=
fastjson;version=3Dv1.6.7;sha256sum=3D4cbfe712a23a581db9b0eb5e1929fb8da8258=
6e90f3d594dc60b508207047b63</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/vbatts/tar-split;v=
ersion=3Dv0.12.2;sha256sum=3D1f3bcd7cebbe3b67a4e7d5d4226f7127ea11bf652ed3b4=
1cc1a0a24cf15e0dd7" rel=3D"noreferrer" target=3D"_blank">github.com/vbatts/=
tar-split;version=3Dv0.12.2;sha256sum=3D1f3bcd7cebbe3b67a4e7d5d4226f7127ea1=
1bf652ed3b41cc1a0a24cf15e0dd7</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/vektah/gqlparser/v=
2;version=3Dv2.5.32;sha256sum=3D9615eb15e094a259de740e284370a8cc4524c137491=
a4a728ab9c350aa5a94d3" rel=3D"noreferrer" target=3D"_blank">github.com/vekt=
ah/gqlparser/v2;version=3Dv2.5.32;sha256sum=3D9615eb15e094a259de740e284370a=
8cc4524c137491a4a728ab9c350aa5a94d3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/withfig/autocomple=
te-tools/integrations/cobra;version=3Dv1.2.1;sha256sum=3Db2a47ab2313e49e370=
73c93dec8d010dc9a44a846a08d87133e574cb9fad10f6" rel=3D"noreferrer" target=
=3D"_blank">github.com/withfig/autocomplete-tools/integrations/cobra;versio=
n=3Dv1.2.1;sha256sum=3Db2a47ab2313e49e37073c93dec8d010dc9a44a846a08d87133e5=
74cb9fad10f6</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/x448/float16;versi=
on=3Dv0.8.4;sha256sum=3D73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f=
0820f7b2f1500" rel=3D"noreferrer" target=3D"_blank">github.com/x448/float16=
;version=3Dv0.8.4;sha256sum=3D73b24a41037ea999ab66851e3798a0973dbb1f2149259=
15b01f0820f7b2f1500</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/xeipuuv/gojsonpoin=
ter;version=3Dv0.0.0-20190905194746-02993c407bfb;sha256sum=3D11b54f0bc358b0=
9261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/xeipuuv/gojsonpointer;version=3Dv0.0.0-20190905194=
746-02993c407bfb;sha256sum=3D11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c=
345c53eab6aaf228de</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/xeipuuv/gojsonrefe=
rence;version=3Dv0.0.0-20180127040603-bd5ef7bd5415;sha256sum=3D7ec98f4df894=
413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/xeipuuv/gojsonreference;version=3Dv0.0.0-2018012=
7040603-bd5ef7bd5415;sha256sum=3D7ec98f4df894413f4dc58c8df330ca8b24ff425b05=
a8e1074c3028c99f7e45e7</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/yashtewari/glob-in=
tersection;version=3Dv0.2.0;sha256sum=3Dbc999bc9a3bcce0ed7c06180320d2236a5c=
32aa61def5a7c79963faa6bcf2fd0" rel=3D"noreferrer" target=3D"_blank">github.=
com/yashtewari/glob-intersection;version=3Dv0.2.0;sha256sum=3Dbc999bc9a3bcc=
e0ed7c06180320d2236a5c32aa61def5a7c79963faa6bcf2fd0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://gitlab.com/gitlab-org/api/cli=
ent-go;version=3Dv1.46.0;sha256sum=3D42ad7a41d100fbcc5851b4df478f45856a7a6d=
a5bc4706ec0e511e287d676049" rel=3D"noreferrer" target=3D"_blank">gitlab.com=
/gitlab-org/api/client-go;version=3Dv1.46.0;sha256sum=3D42ad7a41d100fbcc585=
1b4df478f45856a7a6da5bc4706ec0e511e287d676049</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/auto/sdk;=
version=3Dv1.2.1;sha256sum=3Da08a16fc0a7041cdb875f47a260a56000632212c85f65a=
302a043c76380c8335" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.i=
o/auto/sdk;version=3Dv1.2.1;sha256sum=3Da08a16fc0a7041cdb875f47a260a5600063=
2212c85f65a302a043c76380c8335</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/contrib/i=
nstrumentation/google.golang.org/grpc/otelgrpc;version=3Dv0.63.0;sha256sum=
=3Da093449439c5be2ecaa0c25a4690281445954876a8d4f3396e6d27561d5479dc" rel=3D=
"noreferrer" target=3D"_blank">go.opentelemetry.io/contrib/instrumentation/=
google.golang.org/grpc/otelgrpc;version=3Dv0.63.0;sha256sum=3Da093449439c5b=
e2ecaa0c25a4690281445954876a8d4f3396e6d27561d5479dc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/contrib/i=
nstrumentation/net/http/otelhttp;version=3Dv0.65.0;sha256sum=3Df68a6e3f8f93=
b5857390583f3e855801ce93244ea18bf56ab45c221a4ea32a4c" rel=3D"noreferrer" ta=
rget=3D"_blank">go.opentelemetry.io/contrib/instrumentation/net/http/otelht=
tp;version=3Dv0.65.0;sha256sum=3Df68a6e3f8f93b5857390583f3e855801ce93244ea1=
8bf56ab45c221a4ea32a4c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/otel;vers=
ion=3Dv1.41.0;sha256sum=3D1a624187c6ed53704d278e4cf12c143e1046ba1e894b8ea47=
0cb309d31adf742" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/o=
tel;version=3Dv1.41.0;sha256sum=3D1a624187c6ed53704d278e4cf12c143e1046ba1e8=
94b8ea470cb309d31adf742</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/otel/metr=
ic;version=3Dv1.41.0;sha256sum=3Dee6cd9515bff605dc265e36f60d7ca293ce9206889=
06ef8baef5d016474f2c2f" rel=3D"noreferrer" target=3D"_blank">go.opentelemet=
ry.io/otel/metric;version=3Dv1.41.0;sha256sum=3Dee6cd9515bff605dc265e36f60d=
7ca293ce920688906ef8baef5d016474f2c2f</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.opentelemetry.io/otel/trac=
e;version=3Dv1.41.0;sha256sum=3D6376f38119647b709e49bd13585722a685578fb4e4c=
daa46ed421a3832a2fa9e" rel=3D"noreferrer" target=3D"_blank">go.opentelemetr=
y.io/otel/trace;version=3Dv1.41.0;sha256sum=3D6376f38119647b709e49bd1358572=
2a685578fb4e4cdaa46ed421a3832a2fa9e</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.uber.org/multierr;version=
=3Dv1.11.0;sha256sum=3D2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da7=
7641bddce0c3" rel=3D"noreferrer" target=3D"_blank">go.uber.org/multierr;ver=
sion=3Dv1.11.0;sha256sum=3D2249b5d2fdce61f6ee661a679d8552599af084a761cbbc87=
1da77641bddce0c3</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.uber.org/zap;version=3Dv1.=
27.1;sha256sum=3D38760227142d38369069374c005707bc6b3c270a75f34fa3f17c48c863=
143cdc" rel=3D"noreferrer" target=3D"_blank">go.uber.org/zap;version=3Dv1.2=
7.1;sha256sum=3D38760227142d38369069374c005707bc6b3c270a75f34fa3f17c48c8631=
43cdc</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.yaml.in/yaml/v2;version=3D=
v2.4.3;sha256sum=3Dbacc1ac9ed600be2df58f88b88d5c1b6f6473526fa4069f61549f64b=
81b09f41" rel=3D"noreferrer" target=3D"_blank">go.yaml.in/yaml/v2;version=
=3Dv2.4.3;sha256sum=3Dbacc1ac9ed600be2df58f88b88d5c1b6f6473526fa4069f61549f=
64b81b09f41</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://go.yaml.in/yaml/v3;version=3D=
v3.0.4;sha256sum=3D0317dae56eaa9e9954467c8768fd6a89ba2005f1534e2c26fce5163a=
d8d2ef31" rel=3D"noreferrer" target=3D"_blank">go.yaml.in/yaml/v3;version=
=3Dv3.0.4;sha256sum=3D0317dae56eaa9e9954467c8768fd6a89ba2005f1534e2c26fce51=
63ad8d2ef31</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/crypto;version=
=3Dv0.49.0;sha256sum=3Dcbca45d1fcb0fa359cd232b884ba86cfa1a32644ff7efdeb7980=
7db3eb0f005d" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto;vers=
ion=3Dv0.49.0;sha256sum=3Dcbca45d1fcb0fa359cd232b884ba86cfa1a32644ff7efdeb7=
9807db3eb0f005d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/mod;version=3Dv0=
.34.0;sha256sum=3D8e6b8d8a771dac070d44c8c701b1fba4c3565031f4f7170e6fed9d302=
2b4aa32" rel=3D"noreferrer" target=3D"_blank">golang.org/x/mod;version=3Dv0=
.34.0;sha256sum=3D8e6b8d8a771dac070d44c8c701b1fba4c3565031f4f7170e6fed9d302=
2b4aa32</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/net;version=3Dv0=
.52.0;sha256sum=3D5b8bf13a81552cd4ffc06dae2b78fb1e72ece57e54446e396ff9c1925=
1e917ed" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net;version=3Dv0=
.52.0;sha256sum=3D5b8bf13a81552cd4ffc06dae2b78fb1e72ece57e54446e396ff9c1925=
1e917ed</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/oauth2;version=
=3Dv0.36.0;sha256sum=3D15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156=
002a13304504" rel=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2;vers=
ion=3Dv0.36.0;sha256sum=3D15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851=
156002a13304504</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/sync;version=3Dv=
0.20.0;sha256sum=3D7179d4d68800f6fdcadb9d4bbf11cbb5df9b40360c89305c203fe207=
23cbd375" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sync;version=3D=
v0.20.0;sha256sum=3D7179d4d68800f6fdcadb9d4bbf11cbb5df9b40360c89305c203fe20=
723cbd375</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/sys;version=3Dv0=
.42.0;sha256sum=3D99df0ad90183debc80aee0b7489648574c6baa0c1cf5da37aaf591cf2=
e2d426a" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys;version=3Dv0=
.42.0;sha256sum=3D99df0ad90183debc80aee0b7489648574c6baa0c1cf5da37aaf591cf2=
e2d426a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/term;version=3Dv=
0.41.0;sha256sum=3D91ca75a3f454d5ddede1f58c3e4fc8e169c6f3c037223ac0ac76e782=
34d22828" rel=3D"noreferrer" target=3D"_blank">golang.org/x/term;version=3D=
v0.41.0;sha256sum=3D91ca75a3f454d5ddede1f58c3e4fc8e169c6f3c037223ac0ac76e78=
234d22828</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/text;version=3Dv=
0.35.0;sha256sum=3D2df36ee135211552d1e729d2a2a4b5bbff2bd3a0cc53064151a6e649=
5e947b32" rel=3D"noreferrer" target=3D"_blank">golang.org/x/text;version=3D=
v0.35.0;sha256sum=3D2df36ee135211552d1e729d2a2a4b5bbff2bd3a0cc53064151a6e64=
95e947b32</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/time;version=3Dv=
0.15.0;sha256sum=3D8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad=
9da27f84" rel=3D"noreferrer" target=3D"_blank">golang.org/x/time;version=3D=
v0.15.0;sha256sum=3D8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532a=
d9da27f84</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/api;version=
=3Dv0.269.0;sha256sum=3D226e867540ec7a664a1797f3db25674e3637796cd4b30784bbd=
cbe49a810367d" rel=3D"noreferrer" target=3D"_blank">google.golang.org/api;v=
ersion=3Dv0.269.0;sha256sum=3D226e867540ec7a664a1797f3db25674e3637796cd4b30=
784bbdcbe49a810367d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/genproto;ve=
rsion=3Dv0.0.0-20260128011058-8636f8732409;sha256sum=3D88202f77c2801a95607c=
fa545c68454acdd06a0ec4e5e3269a75baa67d1b82ad" rel=3D"noreferrer" target=3D"=
_blank">google.golang.org/genproto;version=3Dv0.0.0-20260128011058-8636f873=
2409;sha256sum=3D88202f77c2801a95607cfa545c68454acdd06a0ec4e5e3269a75baa67d=
1b82ad</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/genproto/go=
ogleapis/api;version=3Dv0.0.0-20260203192932-546029d2fa20;sha256sum=3D6d03a=
2d9b364a1fc786170236268b402a8500e5c4442b3762989cf0d5729cfaa" rel=3D"norefer=
rer" target=3D"_blank">google.golang.org/genproto/googleapis/api;version=3D=
v0.0.0-20260203192932-546029d2fa20;sha256sum=3D6d03a2d9b364a1fc786170236268=
b402a8500e5c4442b3762989cf0d5729cfaa</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/genproto/go=
ogleapis/rpc;version=3Dv0.0.0-20260217215200-42d3e9bedb6d;sha256sum=3Dd8650=
6b997ea20d69bc8287de38c76b6dea4664d2c543d2ecf545cd7e932fcd8" rel=3D"norefer=
rer" target=3D"_blank">google.golang.org/genproto/googleapis/rpc;version=3D=
v0.0.0-20260217215200-42d3e9bedb6d;sha256sum=3Dd86506b997ea20d69bc8287de38c=
76b6dea4664d2c543d2ecf545cd7e932fcd8</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/grpc;versio=
n=3Dv1.80.0;sha256sum=3D12b91cdce1bbcd837193ef71c42a09b454bff644e0ddab389a3=
96328c2e41779" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc;=
version=3Dv1.80.0;sha256sum=3D12b91cdce1bbcd837193ef71c42a09b454bff644e0dda=
b389a396328c2e41779</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://google.golang.org/protobuf;ve=
rsion=3Dv1.36.11;sha256sum=3D14983d36c56a814ed91b6d652f2b8f895baba1b84eb43b=
28a0b132c8637cd274" rel=3D"noreferrer" target=3D"_blank">google.golang.org/=
protobuf;version=3Dv1.36.11;sha256sum=3D14983d36c56a814ed91b6d652f2b8f895ba=
ba1b84eb43b28a0b132c8637cd274</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/evanphx/json-patch.v=
4;version=3Dv4.13.0;sha256sum=3Dde94747c5023a2c83909845c76acc6b4bfe28b44994=
207394b5e057f3085625a" rel=3D"noreferrer" target=3D"_blank">gopkg.in/evanph=
x/json-patch.v4;version=3Dv4.13.0;sha256sum=3Dde94747c5023a2c83909845c76acc=
6b4bfe28b44994207394b5e057f3085625a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/inf.v0;version=3Dv0.=
9.1;sha256sum=3D08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e5=
374a0" rel=3D"noreferrer" target=3D"_blank">gopkg.in/inf.v0;version=3Dv0.9.=
1;sha256sum=3D08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e537=
4a0</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/ini.v1;version=3Dv1.=
67.1;sha256sum=3D9af5f66337e725f2ec19d23eff4f72e1b14c67b4b0c80b0677a3a2c094=
4cf09c" rel=3D"noreferrer" target=3D"_blank">gopkg.in/ini.v1;version=3Dv1.6=
7.1;sha256sum=3D9af5f66337e725f2ec19d23eff4f72e1b14c67b4b0c80b0677a3a2c0944=
cf09c</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/yaml.v3;version=3Dv3=
.0.1;sha256sum=3Daab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1=
a9a015" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3;version=3Dv3.=
0.1;sha256sum=3Daab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a=
9a015</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/api;version=3Dv0.35.3;=
sha256sum=3Dacc83efef5e4469b0c89e01f62602aed4c285cae5cb4bc2ee0a3fe51baf9e16=
b" rel=3D"noreferrer" target=3D"_blank">k8s.io/api;version=3Dv0.35.3;sha256=
sum=3Dacc83efef5e4469b0c89e01f62602aed4c285cae5cb4bc2ee0a3fe51baf9e16b</a> =
\<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/apimachinery;version=
=3Dv0.35.3;sha256sum=3Dfba136ace873c2c91b81b7be38e11fa74c74dde9526d3f1e22c1=
3c09e648da6d" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery;vers=
ion=3Dv0.35.3;sha256sum=3Dfba136ace873c2c91b81b7be38e11fa74c74dde9526d3f1e2=
2c13c09e648da6d</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/client-go;version=3Dv0=
.35.3;sha256sum=3Deda662eefedead2394dc545b00d2be3e5c5d645cdd9a7c9331b4eeab9=
4fe823b" rel=3D"noreferrer" target=3D"_blank">k8s.io/client-go;version=3Dv0=
.35.3;sha256sum=3Deda662eefedead2394dc545b00d2be3e5c5d645cdd9a7c9331b4eeab9=
4fe823b</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/klog/v2;version=3Dv2.1=
30.1;sha256sum=3D262b961175bbe8cf6ecf227d06303df2eb47bfb890e19d516846422f7d=
406cb9" rel=3D"noreferrer" target=3D"_blank">k8s.io/klog/v2;version=3Dv2.13=
0.1;sha256sum=3D262b961175bbe8cf6ecf227d06303df2eb47bfb890e19d516846422f7d4=
06cb9</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/kube-openapi;version=
=3Dv0.0.0-20250910181357-589584f1c912;sha256sum=3Dc8f5db9fcfdcee9ae6057c0c0=
a2ea1232f0cf27a07d857517c7ad1e38d9950bc" rel=3D"noreferrer" target=3D"_blan=
k">k8s.io/kube-openapi;version=3Dv0.0.0-20250910181357-589584f1c912;sha256s=
um=3Dc8f5db9fcfdcee9ae6057c0c0a2ea1232f0cf27a07d857517c7ad1e38d9950bc</a> \=
<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://k8s.io/utils;version=3Dv0.0.0=
-20251002143259-bc988d571ff4;sha256sum=3D3caff8384915ba747aad7708cf2a4aaa25=
01f952780e64049abe981a57d1cb49" rel=3D"noreferrer" target=3D"_blank">k8s.io=
/utils;version=3Dv0.0.0-20251002143259-bc988d571ff4;sha256sum=3D3caff838491=
5ba747aad7708cf2a4aaa2501f952780e64049abe981a57d1cb49</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://sigs.k8s.io/json;version=3Dv0=
.0.0-20250730193827-2d320260d730;sha256sum=3D7cec6eae3e4e4c9c1e0a009eef2007=
40990fafbcb9cab081eb18ce32f6e7a7b9" rel=3D"noreferrer" target=3D"_blank">si=
gs.k8s.io/json;version=3Dv0.0.0-20250730193827-2d320260d730;sha256sum=3D7ce=
c6eae3e4e4c9c1e0a009eef200740990fafbcb9cab081eb18ce32f6e7a7b9</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://sigs.k8s.io/randfill;version=
=3Dv1.0.0;sha256sum=3D31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d50b2=
532c828f5f1" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/randfill;vers=
ion=3Dv1.0.0;sha256sum=3D31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d5=
0b2532c828f5f1</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://sigs.k8s.io/release-utils;ver=
sion=3Dv0.12.4;sha256sum=3D1bf5824c8978e3b1d3ae83a01facae97c994c2eea6982e15=
050d9291a19558b1" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/release-=
utils;version=3Dv0.12.4;sha256sum=3D1bf5824c8978e3b1d3ae83a01facae97c994c2e=
ea6982e15050d9291a19558b1</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://sigs.k8s.io/structured-merge-=
diff/v6;version=3Dv6.3.0;sha256sum=3Dbcb0e662e31cfbd06b4cb52eb59eef6f0da101=
bce5aedca7dbce1f78c34d637a" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.i=
o/structured-merge-diff/v6;version=3Dv6.3.0;sha256sum=3Dbcb0e662e31cfbd06b4=
cb52eb59eef6f0da101bce5aedca7dbce1f78c34d637a</a> \<br>
&gt; +=C2=A0 =C2=A0 gomod://<a href=3D"http://sigs.k8s.io/yaml;version=3Dv1=
.6.0;sha256sum=3Dcf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e1=
1e5052" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/yaml;version=3Dv1.=
6.0;sha256sum=3Dcf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11=
e5052</a> \<br>
&gt; +&quot;<br>
&gt; diff --git a/recipes-containers/cosign/cosign-licenses.inc b/recipes-c=
ontainers/cosign/cosign-licenses.inc<br>
&gt; new file mode 100644<br>
&gt; index 00000000..4e39c6c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/cosign/cosign-licenses.inc<br>
&gt; @@ -0,0 +1,274 @@<br>
&gt; +<br>
&gt; +# This file has been generated by go-mod-update-modules.bbclass<br>
&gt; +#<br>
&gt; +# Do not modify it by hand, as the contents will be replaced when<br>
&gt; +# running the update-modules task.<br>
&gt; +<br>
&gt; +LICENSE +=3D &quot;&amp; Apache-2.0 &amp; BSD-2-Clause &amp; BSD-3-Cl=
ause &amp; ISC &amp; MIT &amp; MPL-2.0&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/au=
th/oauth2adapt@v0.2.8/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/aut=
h/oauth2adapt@v0.2.8/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/au=
th@v0.18.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0=
" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/auth@v0.18.2/LIC=
ENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/co=
mpute/metadata@v0.9.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/com=
pute/metadata@v0.9.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/ia=
m@v1.5.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" =
rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/iam@v1.5.3/LICENSE=
;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/km=
s@v1.26.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0"=
 rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/kms@v1.26.0/LICEN=
SE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cloud.google.com/go/lo=
ngrunning@v0.8.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApac=
he-2.0" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/longrunnin=
g@v0.8.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cuelabs.dev/go/oci/oci=
registry@v0.0.0-20251212221603-3adeb8663819/LICENSE;md5=3D175792518e4ac015a=
b6696d16c4f607e;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">cue=
labs.dev/go/oci/ociregistry@v0.0.0-20251212221603-3adeb8663819/LICENSE;md5=
=3D175792518e4ac015ab6696d16c4f607e;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://cuelang.org/go@v0.16.0=
/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"n=
oreferrer" target=3D"_blank">cuelang.org/go@v0.16.0/LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!aliyun!con=
tainer!service/ack-ram-tool/pkg/credentials/provider@v0.14.0/LICENSE;md5=3D=
86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/!aliyun!container!service/ack-ram-tool/pkg/credent=
ials/provider@v0.14.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure!a!d/=
microsoft-authentication-library-for-go@v1.6.0/LICENSE;md5=3De74f78882cab57=
fd1cc4c5482b9a214a;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.=
com/!azure!a!d/microsoft-authentication-library-for-go@v1.6.0/LICENSE;md5=
=3De74f78882cab57fd1cc4c5482b9a214a;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go/sdk/azcore@v1.21.0/LICENSE.txt;md5=3Da93cb0863fda8e7f177e09f69=
43951b4;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/!azure/=
azure-sdk-for-go/sdk/azcore@v1.21.0/LICENSE.txt;md5=3Da93cb0863fda8e7f177e0=
9f6943951b4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go/sdk/azidentity@v1.13.1/LICENSE.txt;md5=3Da93cb0863fda8e7f177e0=
9f6943951b4;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/!az=
ure/azure-sdk-for-go/sdk/azidentity@v1.13.1/LICENSE.txt;md5=3Da93cb0863fda8=
e7f177e09f6943951b4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go/sdk/internal@v1.11.2/LICENSE.txt;md5=3Da93cb0863fda8e7f177e09f=
6943951b4;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/!azur=
e/azure-sdk-for-go/sdk/internal@v1.11.2/LICENSE.txt;md5=3Da93cb0863fda8e7f1=
77e09f6943951b4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go/sdk/security/keyvault/azkeys@v1.4.0/LICENSE.txt;md5=3D261d8686=
a7cf1ce9570cdc99746659f8;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/!azure/azure-sdk-for-go/sdk/security/keyvault/azkeys@v1.4.0/LICEN=
SE.txt;md5=3D261d8686a7cf1ce9570cdc99746659f8;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go/sdk/security/keyvault/internal@v1.2.0/LICENSE.txt;md5=3D261d86=
86a7cf1ce9570cdc99746659f8;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank"=
>github.com/!azure/azure-sdk-for-go/sdk/security/keyvault/internal@v1.2.0/L=
ICENSE.txt;md5=3D261d8686a7cf1ce9570cdc99746659f8;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/azur=
e-sdk-for-go@v68.0.0+incompatible/LICENSE.txt;md5=3D4f7454c9bcbb0acee6d9a97=
1001befe2;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/!azur=
e/azure-sdk-for-go@v68.0.0+incompatible/LICENSE.txt;md5=3D4f7454c9bcbb0acee=
6d9a971001befe2;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/autorest/adal@v0.9.23/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18=
b;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!azure=
/go-autorest/autorest/adal@v0.9.23/LICENSE;md5=3Da250e5ac3848f2acadb5adcb95=
55c18b;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/autorest/azure/auth@v0.5.12/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9=
555c18b;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/=
!azure/go-autorest/autorest/azure/auth@v0.5.12/LICENSE;md5=3Da250e5ac3848f2=
acadb5adcb9555c18b;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/autorest/azure/cli@v0.4.6/LICENSE;md5=3Da250e5ac3848f2acadb5adcb955=
5c18b;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!a=
zure/go-autorest/autorest/azure/cli@v0.4.6/LICENSE;md5=3Da250e5ac3848f2acad=
b5adcb9555c18b;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/autorest/date@v0.3.0/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b=
;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!azure/=
go-autorest/autorest/date@v0.3.0/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555=
c18b;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/autorest@v0.11.29/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;sp=
dx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!azure/go-=
autorest/autorest@v0.11.29/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/logger@v0.2.1/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!azure/go-au=
torest/logger@v0.2.1/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/!azure/go-a=
utorest/tracing@v0.6.0/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/!azure/go-au=
torest/tracing@v0.6.0/LICENSE;md5=3Da250e5ac3848f2acadb5adcb9555c18b;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/agnivade/le=
venshtein@v1.2.1/License.txt;md5=3D911630ea868cb9d6ca549532110fd8fd;spdx=3D=
MIT" rel=3D"noreferrer" target=3D"_blank">github.com/agnivade/levenshtein@v=
1.2.1/License.txt;md5=3D911630ea868cb9d6ca549532110fd8fd;spdx=3DMIT</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/alibabacloud-gateway-spi@v0.0.4/LICENSE;md5=3D815228b833e1826a08c7cef5=
b6f00363;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com=
/alibabacloud-go/alibabacloud-gateway-spi@v0.0.4/LICENSE;md5=3D815228b833e1=
826a08c7cef5b6f00363;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/cr-20181201@v1.0.10/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabaclou=
d-go/cr-20181201@v1.0.10/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/darabonba-openapi@v0.2.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6f0036=
3;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibab=
acloud-go/darabonba-openapi@v0.2.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6=
f00363;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/debug@v1.0.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabacloud-go/de=
bug@v1.0.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/endpoint-util@v1.1.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;sp=
dx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabaclo=
ud-go/endpoint-util@v1.1.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/openapi-util@v0.1.0/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabaclou=
d-go/openapi-util@v0.1.0/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/tea-utils@v1.4.5/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabacloud=
-go/tea-utils@v1.4.5/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/tea-xml@v1.1.3/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DA=
pache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabacloud-go/=
tea-xml@v1.1.3/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DApache=
-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alibabaclou=
d-go/tea@v1.2.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DApach=
e-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/alibabacloud-go/tea@=
v1.2.1/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DApache-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aliyun/cred=
entials-go@v1.3.2/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aliyun/credentials=
-go@v1.3.2/LICENSE;md5=3D815228b833e1826a08c7cef5b6f00363;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/asaskevich/=
govalidator@v0.0.0-20230301143203-a9d515a09cc2/LICENSE;md5=3D44f42f71b11455=
16f11eb20da85d7344;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.=
com/asaskevich/govalidator@v0.0.0-20230301143203-a9d515a09cc2/LICENSE;md5=
=3D44f42f71b1145516f11eb20da85d7344;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/config@v1.32.10/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;s=
pdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-s=
dk-go-v2/config@v1.32.10/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/credentials@v1.19.10/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/=
aws-sdk-go-v2/credentials@v1.19.10/LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/feature/ec2/imds@v1.18.18/LICENSE.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com=
/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.18/LICENSE.txt;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/internal/configsources@v1.4.18/LICENSE.txt;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.18/LICENSE.txt;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/internal/endpoints/v2@v2.7.18/LICENSE.txt;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github=
.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.18/LICENSE.txt;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/internal/ini@v1.8.4/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/a=
ws-sdk-go-v2/internal/ini@v1.8.4/LICENSE.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/ecr@v1.55.3/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/a=
ws-sdk-go-v2/service/ecr@v1.55.3/LICENSE.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/ecrpublic@v1.38.10/LICENSE.txt;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.co=
m/aws/aws-sdk-go-v2/service/ecrpublic@v1.38.10/LICENSE.txt;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/internal/accept-encoding@v1.13.5/LICENSE.txt;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.5/=
LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<=
br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/internal/presigned-url@v1.13.18/LICENSE.txt;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.18/LI=
CENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br=
>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/kms@v1.50.1/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/a=
ws-sdk-go-v2/service/kms@v1.50.1/LICENSE.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/signin@v1.0.6/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws=
/aws-sdk-go-v2/service/signin@v1.0.6/LICENSE.txt;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/sso@v1.30.11/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/=
aws-sdk-go-v2/service/sso@v1.30.11/LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/ssooidc@v1.35.15/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/=
aws/aws-sdk-go-v2/service/ssooidc@v1.35.15/LICENSE.txt;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2/service/sts@v1.41.7/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/a=
ws-sdk-go-v2/service/sts@v1.41.7/LICENSE.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2@v1.41.2/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DAp=
ache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2=
@v1.41.2/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/aws-sdk=
-go-v2@v1.41.2/internal/sync/singleflight/LICENSE;md5=3Dbdc234595bc2fe37091=
8f5de5077c8e9;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/aws/aws-sdk-go-v2@v1.41.2/internal/sync/singleflight/LICENSE;md5=3D=
bdc234595bc2fe370918f5de5077c8e9;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/smithy-=
go@v1.24.1/LICENSE;md5=3D34400b68072d710fecd0a2940a0d1658;spdx=3DApache-2.0=
" rel=3D"noreferrer" target=3D"_blank">github.com/aws/smithy-go@v1.24.1/LIC=
ENSE;md5=3D34400b68072d710fecd0a2940a0d1658;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/aws/smithy-=
go@v1.24.1/internal/sync/singleflight/LICENSE;md5=3Dbdc234595bc2fe370918f5d=
e5077c8e9;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.=
com/aws/smithy-go@v1.24.1/internal/sync/singleflight/LICENSE;md5=3Dbdc23459=
5bc2fe370918f5de5077c8e9;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/awslabs/ama=
zon-ecr-credential-helper/ecr-login@v0.12.0/LICENSE;md5=3De60493c23a6358c3e=
44f125a289c0692;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/awslabs/amazon-ecr-credential-helper/ecr-login@v0.12.0/LICENSE;md5=
=3De60493c23a6358c3e44f125a289c0692;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/blang/semve=
r@v3.5.1+incompatible/LICENSE;md5=3D5a3ade42a900439691ebc22013660cae;spdx=
=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/blang/semver@v3.5.1=
+incompatible/LICENSE;md5=3D5a3ade42a900439691ebc22013660cae;spdx=3DMIT</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/buildkite/a=
gent/v3@v3.118.0/LICENSE.txt;md5=3D56f76a415afa1476c8632f1944a0e0bd;spdx=3D=
MIT" rel=3D"noreferrer" target=3D"_blank">github.com/buildkite/agent/v3@v3.=
118.0/LICENSE.txt;md5=3D56f76a415afa1476c8632f1944a0e0bd;spdx=3DMIT</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/buildkite/g=
o-pipeline@v0.16.0/LICENSE;md5=3De5997726ed2708dfa419572da9dbadaa;spdx=3DMI=
T" rel=3D"noreferrer" target=3D"_blank">github.com/buildkite/go-pipeline@v0=
.16.0/LICENSE;md5=3De5997726ed2708dfa419572da9dbadaa;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/buildkite/i=
nterpolate@v0.1.5/LICENSE.txt;md5=3D5d73adf54d93c6c9f4a0a6f136cfec4f;spdx=
=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/buildkite/interpola=
te@v0.1.5/LICENSE.txt;md5=3D5d73adf54d93c6c9f4a0a6f136cfec4f;spdx=3DMIT</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/buildkite/r=
oko@v1.4.0/LICENSE.md;md5=3D6926b41f021e7ddd23997afe97615111;spdx=3DMIT" re=
l=3D"noreferrer" target=3D"_blank">github.com/buildkite/roko@v1.4.0/LICENSE=
.md;md5=3D6926b41f021e7ddd23997afe97615111;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/cenkalti/ba=
ckoff/v4@v4.3.0/LICENSE;md5=3D1571d94433e3f3aa05267efd4dbea68b;spdx=3DMIT" =
rel=3D"noreferrer" target=3D"_blank">github.com/cenkalti/backoff/v4@v4.3.0/=
LICENSE;md5=3D1571d94433e3f3aa05267efd4dbea68b;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/cenkalti/ba=
ckoff/v5@v5.0.3/LICENSE;md5=3D1571d94433e3f3aa05267efd4dbea68b;spdx=3DMIT" =
rel=3D"noreferrer" target=3D"_blank">github.com/cenkalti/backoff/v5@v5.0.3/=
LICENSE;md5=3D1571d94433e3f3aa05267efd4dbea68b;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/cespare/xxh=
ash/v2@v2.3.0/LICENSE.txt;md5=3D802da049c92a99b4387d3f3d91b00fa9;spdx=3DMIT=
" rel=3D"noreferrer" target=3D"_blank">github.com/cespare/xxhash/v2@v2.3.0/=
LICENSE.txt;md5=3D802da049c92a99b4387d3f3d91b00fa9;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/chrismellar=
d/docker-credential-acr-env@v0.0.0-20230304212654-82a0ddb27589/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/chrismellard/docker-credential-acr-env@v0.0.0-2=
0230304212654-82a0ddb27589/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/clbanning/m=
xj/v2@v2.7.0/LICENSE;md5=3Db95d77640f09a1f26a37017288284f35;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/clbanning/mxj/v2@v2.7.0/LICENS=
E;md5=3Db95d77640f09a1f26a37017288284f35;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/cockroachdb=
/apd/v3@v3.2.1/LICENSE;md5=3D91fa97a925e58262605528603a297ccd;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/cockroachdb/apd/v3@v3=
.2.1/LICENSE;md5=3D91fa97a925e58262605528603a297ccd;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/common-nigh=
thawk/go-figure@v0.0.0-20210622060536-734e95fb86be/LICENSE;md5=3Df37e5ec1bc=
71f8242927b328878a744d;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/common-nighthawk/go-figure@v0.0.0-20210622060536-734e95fb86be/LICEN=
SE;md5=3Df37e5ec1bc71f8242927b328878a744d;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/containerd/=
stargz-snapshotter/estargz@v0.18.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/c=
ontainerd/stargz-snapshotter/estargz@v0.18.2/LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/coreos/go-o=
idc/v3@v3.17.0/LICENSE;md5=3Dd2794c0df5b907fdace235a619d80314;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/coreos/go-oidc/v3@v3.=
17.0/LICENSE;md5=3Dd2794c0df5b907fdace235a619d80314;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/cyberphone/=
json-canonicalization@v0.0.0-20241213102144-19d51d7fe467/LICENSE;md5=3D84f5=
89d883da07bef20c745c96b1019c;spdx=3DApache-2.0" rel=3D"noreferrer" target=
=3D"_blank">github.com/cyberphone/json-canonicalization@v0.0.0-202412131021=
44-19d51d7fe467/LICENSE;md5=3D84f589d883da07bef20c745c96b1019c;spdx=3DApach=
e-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/davecgh/go-=
spew@v1.1.2-0.20180830191138-d8f796af33cc/LICENSE;md5=3Dc06795ed54b2a35ebee=
b543cd3a73e56;spdx=3DISC" rel=3D"noreferrer" target=3D"_blank">github.com/d=
avecgh/go-spew@v1.1.2-0.20180830191138-d8f796af33cc/LICENSE;md5=3Dc06795ed5=
4b2a35ebeeb543cd3a73e56;spdx=3DISC</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/digitorus/p=
kcs7@v0.0.0-20230818184609-3a137a874352/LICENSE;md5=3Da9b2952d51b44eae97b60=
90117f60792;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/dig=
itorus/pkcs7@v0.0.0-20230818184609-3a137a874352/LICENSE;md5=3Da9b2952d51b44=
eae97b6090117f60792;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/digitorus/t=
imestamp@v0.0.0-20231217203849-220c5c2851b7/LICENSE;md5=3Dee17b041b11533700=
fde49eee80a1553;spdx=3DBSD-2-Clause" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/digitorus/timestamp@v0.0.0-20231217203849-220c5c2851b7/LICENSE;md=
5=3Dee17b041b11533700fde49eee80a1553;spdx=3DBSD-2-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/dimchansky/=
utfbom@v1.1.1/LICENSE;md5=3Dd5b81a403268b5ea485b4a2579630c17;spdx=3DApache-=
2.0" rel=3D"noreferrer" target=3D"_blank">github.com/dimchansky/utfbom@v1.1=
.1/LICENSE;md5=3Dd5b81a403268b5ea485b4a2579630c17;spdx=3DApache-2.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/docker/cli@=
v29.3.0+incompatible/LICENSE;md5=3D9740d093a080530b5c5c6573df9af45a;spdx=3D=
Apache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli@v29.=
3.0+incompatible/LICENSE;md5=3D9740d093a080530b5c5c6573df9af45a;spdx=3DApac=
he-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/docker/dist=
ribution@v2.8.3+incompatible/LICENSE;md5=3Dd2794c0df5b907fdace235a619d80314=
;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/docker/=
distribution@v2.8.3+incompatible/LICENSE;md5=3Dd2794c0df5b907fdace235a619d8=
0314;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/docker/dock=
er-credential-helpers@v0.9.5/LICENSE;md5=3D5f28a5a15a6bde800864f444aee95768=
;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker-=
credential-helpers@v0.9.5/LICENSE;md5=3D5f28a5a15a6bde800864f444aee95768;sp=
dx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/dustin/go-h=
umanize@v1.0.1/LICENSE;md5=3D8c6127b79304a5e0a5756d03c7a58766;spdx=3DMIT" r=
el=3D"noreferrer" target=3D"_blank">github.com/dustin/go-humanize@v1.0.1/LI=
CENSE;md5=3D8c6127b79304a5e0a5756d03c7a58766;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/emicklei/go=
-restful/v3@v3.13.0/LICENSE;md5=3D2ebc1c12a0f4eae5394522e31961e1de;spdx=3DM=
IT" rel=3D"noreferrer" target=3D"_blank">github.com/emicklei/go-restful/v3@=
v3.13.0/LICENSE;md5=3D2ebc1c12a0f4eae5394522e31961e1de;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/emicklei/pr=
oto@v1.14.3/LICENSE;md5=3Db1ce415d97e837c8677d332b274d4f0b;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/emicklei/proto@v1.14.3/LICENSE=
;md5=3Db1ce415d97e837c8677d332b274d4f0b;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/felixge/htt=
psnoop@v1.0.4/LICENSE.txt;md5=3D684da2bf3eed8fc8860e75ad84638225;spdx=3DMIT=
" rel=3D"noreferrer" target=3D"_blank">github.com/felixge/httpsnoop@v1.0.4/=
LICENSE.txt;md5=3D684da2bf3eed8fc8860e75ad84638225;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/fsnotify/fs=
notify@v1.9.0/LICENSE;md5=3D8bae8b116e2cfd723492b02d9a212fe2;spdx=3DBSD-3-C=
lause" rel=3D"noreferrer" target=3D"_blank">github.com/fsnotify/fsnotify@v1=
.9.0/LICENSE;md5=3D8bae8b116e2cfd723492b02d9a212fe2;spdx=3DBSD-3-Clause</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/fxamacker/c=
bor/v2@v2.9.0/LICENSE;md5=3D827f5a2fa861382d35a3943adf9ebb86;spdx=3DMIT" re=
l=3D"noreferrer" target=3D"_blank">github.com/fxamacker/cbor/v2@v2.9.0/LICE=
NSE;md5=3D827f5a2fa861382d35a3943adf9ebb86;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-chi/chi/=
v5@v5.2.5/LICENSE;md5=3Deef59fdf1c5117072cbf52b79c6ea691;spdx=3DMIT" rel=3D=
"noreferrer" target=3D"_blank">github.com/go-chi/chi/v5@v5.2.5/LICENSE;md5=
=3Deef59fdf1c5117072cbf52b79c6ea691;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-jose/go-=
jose/v4@v4.1.4/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go-jose/v4@v4=
.1.4/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-jose/go-=
jose/v4@v4.1.4/json/LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=3DB=
SD-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go-jos=
e/v4@v4.1.4/json/LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=3DBSD-=
3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-logr/log=
r@v1.4.3/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0" =
rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/logr@v1.4.3/LICENSE=
;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-logr/std=
r@v1.2.2/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0" =
rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/stdr@v1.2.2/LICENSE=
;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
analysis@v0.24.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApac=
he-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/analysis=
@v0.24.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
errors@v0.22.7/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/errors@v0.=
22.7/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
jsonpointer@v0.22.5/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DA=
pache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/jsonp=
ointer@v0.22.5/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache=
-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
jsonreference@v0.21.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/j=
sonreference@v0.21.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
loads@v0.23.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-=
2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/loads@v0.23=
.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
runtime@v0.29.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApach=
e-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/runtime@v=
0.29.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
runtime@v0.29.3/middleware/denco/LICENSE;md5=3D9191b4cb03404322c952b5e2a69c=
0914;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi=
/runtime@v0.29.3/middleware/denco/LICENSE;md5=3D9191b4cb03404322c952b5e2a69=
c0914;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
spec@v0.22.4/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/spec@v0.22.4=
/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
strfmt@v0.26.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/strfmt@v0.=
26.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/cmdutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/cmdutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/conv@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/swag/co=
nv@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/fileutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/fileutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/jsonname@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/jsonname@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/jsonutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/jsonutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/loading@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/swag=
/loading@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApac=
he-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/mangling@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/mangling@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/netutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/netutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/stringutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/=
swag/stringutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/typeutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/typeutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag/yamlutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/s=
wag/yamlutils@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
swag@v0.25.5/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/swag@v0.25.5=
/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-openapi/=
validate@v0.25.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApac=
he-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/validate=
@v0.25.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/go-viper/ma=
pstructure/v2@v2.5.0/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3D=
MIT" rel=3D"noreferrer" target=3D"_blank">github.com/go-viper/mapstructure/=
v2@v2.5.0/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3DMIT</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/gobwas/glob=
@v0.2.3/LICENSE;md5=3D0945febef83436030e30c73ea9980b42;spdx=3DMIT" rel=3D"n=
oreferrer" target=3D"_blank">github.com/gobwas/glob@v0.2.3/LICENSE;md5=3D09=
45febef83436030e30c73ea9980b42;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/golang/snap=
py@v0.0.4/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f9aac6;spdx=3DBSD-3-Claus=
e" rel=3D"noreferrer" target=3D"_blank">github.com/golang/snappy@v0.0.4/LIC=
ENSE;md5=3Db8b79c7d4cda128290b98c6a21f9aac6;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/golang-jwt/=
jwt/v4@v4.5.2/LICENSE;md5=3Da21b708d8b320c68979c44ac9dba9b0d;spdx=3DMIT" re=
l=3D"noreferrer" target=3D"_blank">github.com/golang-jwt/jwt/v4@v4.5.2/LICE=
NSE;md5=3Da21b708d8b320c68979c44ac9dba9b0d;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/golang-jwt/=
jwt/v5@v5.3.0/LICENSE;md5=3Da21b708d8b320c68979c44ac9dba9b0d;spdx=3DMIT" re=
l=3D"noreferrer" target=3D"_blank">github.com/golang-jwt/jwt/v5@v5.3.0/LICE=
NSE;md5=3Da21b708d8b320c68979c44ac9dba9b0d;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/cert=
ificate-transparency-go@v1.3.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/googl=
e/certificate-transparency-go@v1.3.3/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/gnos=
tic-models@v0.7.0/LICENSE;md5=3Db1e01b26bacfc2232046c90a330332b3;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/google/gnostic-mod=
els@v0.7.0/LICENSE;md5=3Db1e01b26bacfc2232046c90a330332b3;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/go-c=
mp@v0.7.0/LICENSE;md5=3D4ac66f7dea41d8d116cb7fb28aeff2ab;spdx=3DBSD-3-Claus=
e" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp@v0.7.0/LIC=
ENSE;md5=3D4ac66f7dea41d8d116cb7fb28aeff2ab;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/go-c=
ontainerregistry@v0.21.3/LICENSE;md5=3D175792518e4ac015ab6696d16c4f607e;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-c=
ontainerregistry@v0.21.3/LICENSE;md5=3D175792518e4ac015ab6696d16c4f607e;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/go-g=
ithub/v73@v73.0.0/LICENSE;md5=3D44714fe40638e49453cfb438ddd301f1;spdx=3DBSD=
-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-github=
/v73@v73.0.0/LICENSE;md5=3D44714fe40638e49453cfb438ddd301f1;spdx=3DBSD-3-Cl=
ause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/go-q=
uerystring@v1.2.0/LICENSE;md5=3D29f156828ca5f2df0d1c12543a75f12a;spdx=3DBSD=
-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-querys=
tring@v1.2.0/LICENSE;md5=3D29f156828ca5f2df0d1c12543a75f12a;spdx=3DBSD-3-Cl=
ause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/s2a-=
go@v0.1.9/LICENSE.md;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0" rel=3D"noreferrer" target=3D"_blank">github.com/google/s2a-go@v0.1.9/LI=
CENSE.md;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/google/uuid=
@v1.6.0/LICENSE;md5=3D88073b6dd8ec00fe09da59e0b6dfded1;spdx=3DBSD-3-Clause"=
 rel=3D"noreferrer" target=3D"_blank">github.com/google/uuid@v1.6.0/LICENSE=
;md5=3D88073b6dd8ec00fe09da59e0b6dfded1;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/googleapis/=
enterprise-certificate-proxy@v0.3.12/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com=
/googleapis/enterprise-certificate-proxy@v0.3.12/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/googleapis/=
gax-go/v2@v2.17.0/LICENSE;md5=3D0dd48ae8103725bd7b401261520cdfbb;spdx=3DBSD=
-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/gax-g=
o/v2@v2.17.0/LICENSE;md5=3D0dd48ae8103725bd7b401261520cdfbb;spdx=3DBSD-3-Cl=
ause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/grpc-ecosys=
tem/grpc-gateway/v2@v2.27.7/LICENSE;md5=3Dc510a2a01572b82d27f28fd4d02ca318;=
spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-e=
cosystem/grpc-gateway/v2@v2.27.7/LICENSE;md5=3Dc510a2a01572b82d27f28fd4d02c=
a318;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/e=
rrwrap@v1.1.0/LICENSE;md5=3Db278a92d2c1509760384428817710378;spdx=3DMPL-2.0=
" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/errwrap@v1.1.0/=
LICENSE;md5=3Db278a92d2c1509760384428817710378;spdx=3DMPL-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-cleanhttp@v0.5.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea;spdx=3DMP=
L-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-cleanht=
tp@v0.5.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea;spdx=3DMPL-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-multierror@v1.1.1/LICENSE;md5=3Dd44fdeb607e2d2614db9464dbedd4094;spdx=3DM=
PL-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multie=
rror@v1.1.1/LICENSE;md5=3Dd44fdeb607e2d2614db9464dbedd4094;spdx=3DMPL-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-retryablehttp@v0.7.8/LICENSE;md5=3Dbffc21c92b5f3adcbbb06f8e0067e786;spdx=
=3DMPL-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-re=
tryablehttp@v0.7.8/LICENSE;md5=3Dbffc21c92b5f3adcbbb06f8e0067e786;spdx=3DMP=
L-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-rootcerts@v1.0.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea;spdx=3DMP=
L-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-rootcer=
ts@v1.0.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea;spdx=3DMPL-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-secure-stdlib/parseutil@v0.2.0/LICENSE;md5=3D2925e7910462fe55fcd3a652c4cf=
2a2d;spdx=3DMPL-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashic=
orp/go-secure-stdlib/parseutil@v0.2.0/LICENSE;md5=3D2925e7910462fe55fcd3a65=
2c4cf2a2d;spdx=3DMPL-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-secure-stdlib/strutil@v0.1.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1=
ea;spdx=3DMPL-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicor=
p/go-secure-stdlib/strutil@v0.1.2/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42=
db1ea;spdx=3DMPL-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/g=
o-sockaddr@v1.0.7/LICENSE;md5=3D384a9beb4b0f73244fce13683da4c7da;spdx=3DMPL=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-sockaddr=
@v1.0.7/LICENSE;md5=3D384a9beb4b0f73244fce13683da4c7da;spdx=3DMPL-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/h=
cl@v1.0.1-vault-7/LICENSE;md5=3Db278a92d2c1509760384428817710378;spdx=3DMPL=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/hcl@v1.0.1-=
vault-7/LICENSE;md5=3Db278a92d2c1509760384428817710378;spdx=3DMPL-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/hashicorp/v=
ault/api@v1.22.0/LICENSE;md5=3Dbffc21c92b5f3adcbbb06f8e0067e786;spdx=3DMPL-=
2.0" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/vault/api@v1=
.22.0/LICENSE;md5=3Dbffc21c92b5f3adcbbb06f8e0067e786;spdx=3DMPL-2.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/in-toto/att=
estation@v1.1.2/LICENSE;md5=3D1a161be702d6505e540097b42efb3a26;spdx=3DApach=
e-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/in-toto/attestation@=
v1.1.2/LICENSE;md5=3D1a161be702d6505e540097b42efb3a26;spdx=3DApache-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/in-toto/in-=
toto-golang@v0.10.0/LICENSE;md5=3D7f23e46c93f32afcb729ca6c74f2ecfd;spdx=3DA=
pache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/in-toto/in-toto-=
golang@v0.10.0/LICENSE;md5=3D7f23e46c93f32afcb729ca6c74f2ecfd;spdx=3DApache=
-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/jedisct1/go=
-minisign@v0.0.0-20230811132847-661be99b8267/LICENSE;md5=3D0acd1ff194e0fd02=
6c420d1b1396bdfb;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.co=
m/jedisct1/go-minisign@v0.0.0-20230811132847-661be99b8267/LICENSE;md5=3D0ac=
d1ff194e0fd026c420d1b1396bdfb;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/jellydator/=
ttlcache/v3@v3.4.0/LICENSE;md5=3D4cea77626c625d583c98a85a8658f9d2;spdx=3DMI=
T" rel=3D"noreferrer" target=3D"_blank">github.com/jellydator/ttlcache/v3@v=
3.4.0/LICENSE;md5=3D4cea77626c625d583c98a85a8658f9d2;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/json-iterat=
or/go@v1.1.12/LICENSE;md5=3D0b69744b481d72d30dbf69f84a451cfd;spdx=3DMIT" re=
l=3D"noreferrer" target=3D"_blank">github.com/json-iterator/go@v1.1.12/LICE=
NSE;md5=3D0b69744b481d72d30dbf69f84a451cfd;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/klauspost/c=
ompress@v1.18.4/LICENSE;md5=3Dd0fd9ebda39468b51ff4539c9fbb13a8;spdx=3DBSD-3=
-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress=
@v1.18.4/LICENSE;md5=3Dd0fd9ebda39468b51ff4539c9fbb13a8;spdx=3DBSD-3-Clause=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/klauspost/c=
ompress@v1.18.4/internal/snapref/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f9=
aac6;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/k=
lauspost/compress@v1.18.4/internal/snapref/LICENSE;md5=3Db8b79c7d4cda128290=
b98c6a21f9aac6;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/klauspost/c=
ompress@v1.18.4/zstd/internal/xxhash/LICENSE.txt;md5=3D802da049c92a99b4387d=
3f3d91b00fa9;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/kl=
auspost/compress@v1.18.4/zstd/internal/xxhash/LICENSE.txt;md5=3D802da049c92=
a99b4387d3f3d91b00fa9;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/kylelemons/=
godebug@v1.1.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache=
-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/kylelemons/godebug@v1=
.1.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/blackmagic@v1.0.4/LICENSE;md5=3D8144a188cc06dee37074f74ffc17c90e;spdx=3DMI=
T" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/blackmagic@v=
1.0.4/LICENSE;md5=3D8144a188cc06dee37074f74ffc17c90e;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/dsig@v1.0.0/LICENSE;md5=3D9badcf00edde83118bdbae8ede880e37;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/dsig@v1.0.0/LICENS=
E;md5=3D9badcf00edde83118bdbae8ede880e37;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/httpcc@v1.0.1/LICENSE;md5=3Dc1d03a9175ab48d85c699b2eb51ae56e;spdx=3DMIT" r=
el=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/httpcc@v1.0.1/LI=
CENSE;md5=3Dc1d03a9175ab48d85c699b2eb51ae56e;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/httprc/v3@v3.0.2/LICENSE;md5=3Db32dcc545c67b6bd57b30b946ad44e0b;spdx=3DMIT=
" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/httprc/v3@v3.=
0.2/LICENSE;md5=3Db32dcc545c67b6bd57b30b946ad44e0b;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/jwx/v3@v3.0.13/LICENSE;md5=3Dc94689f9bcf3eb6a81ad8f45767d5be3;spdx=3DMIT" =
rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/jwx/v3@v3.0.13/=
LICENSE;md5=3Dc94689f9bcf3eb6a81ad8f45767d5be3;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/lestrrat-go=
/option/v2@v2.0.0/LICENSE;md5=3D8144a188cc06dee37074f74ffc17c90e;spdx=3DMIT=
" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/option/v2@v2.=
0.0/LICENSE;md5=3D8144a188cc06dee37074f74ffc17c90e;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/letsencrypt=
/boulder@v0.20260223.0/LICENSE.txt;md5=3Db4cdc468055cdcf98982fc01770a84ad;s=
pdx=3DMPL-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/letsencrypt/=
boulder@v0.20260223.0/LICENSE.txt;md5=3Db4cdc468055cdcf98982fc01770a84ad;sp=
dx=3DMPL-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mitchellh/g=
o-homedir@v1.1.0/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3DMIT"=
 rel=3D"noreferrer" target=3D"_blank">github.com/mitchellh/go-homedir@v1.1.=
0/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mitchellh/g=
o-wordwrap@v1.0.1/LICENSE.md;md5=3D56da355a12d4821cda57b8f23ec34bc4;spdx=3D=
MIT" rel=3D"noreferrer" target=3D"_blank">github.com/mitchellh/go-wordwrap@=
v1.0.1/LICENSE.md;md5=3D56da355a12d4821cda57b8f23ec34bc4;spdx=3DMIT</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mitchellh/m=
apstructure@v1.5.1-0.20231216201459-8508981c8b6c/LICENSE;md5=3D3f7765c3d4f5=
8e1f84c4313cecf0f5bd;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mitchellh/mapstructure@v1.5.1-0.20231216201459-8508981c8b6c/LICENSE;m=
d5=3D3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/moby/term@v=
0.5.2/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28;spdx=3DApache-2.0" rel=
=3D"noreferrer" target=3D"_blank">github.com/moby/term@v0.5.2/LICENSE;md5=
=3D4859e97a9c7780e77972d989f0823f28;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/modern-go/c=
oncurrent@v0.0.0-20180306012644-bacd9c7ef1dd/LICENSE;md5=3D86d3f3a95c324c94=
79bd8986968f4327;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/modern-go/concurrent@v0.0.0-20180306012644-bacd9c7ef1dd/LICENSE;md=
5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/modern-go/r=
eflect2@v1.0.3-0.20250322232337-35a7c28c31ee/LICENSE;md5=3D86d3f3a95c324c94=
79bd8986968f4327;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/modern-go/reflect2@v1.0.3-0.20250322232337-35a7c28c31ee/LICENSE;md=
5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mozillazg/d=
ocker-credential-acr-helper@v0.4.0/LICENSE;md5=3Dc0b137aa60bc4d0c1f728a404e=
4c69fe;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/mozillaz=
g/docker-credential-acr-helper@v0.4.0/LICENSE;md5=3Dc0b137aa60bc4d0c1f728a4=
04e4c69fe;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/munnerz/goa=
utoneg@v0.0.0-20191010083416-a7dc8b61c822/LICENSE;md5=3D0c241922fc69330e2e5=
590de114f3bf5;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/munnerz/goautoneg@v0.0.0-20191010083416-a7dc8b61c822/LICENSE;md5=3D=
0c241922fc69330e2e5590de114f3bf5;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/natefinch/a=
tomic@v1.0.1/LICENSE;md5=3D18434e48fe4af02ba5f6e67f4b56f5f7;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/natefinch/atomic@v1.0.1/LICENS=
E;md5=3D18434e48fe4af02ba5f6e67f4b56f5f7;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/nozzle/thro=
ttler@v0.0.0-20180817012639-2ea982251481/LICENSE;md5=3Dd2794c0df5b907fdace2=
35a619d80314;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github=
.com/nozzle/throttler@v0.0.0-20180817012639-2ea982251481/LICENSE;md5=3Dd279=
4c0df5b907fdace235a619d80314;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/oklog/ulid/=
v2@v2.1.1/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0"=
 rel=3D"noreferrer" target=3D"_blank">github.com/oklog/ulid/v2@v2.1.1/LICEN=
SE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/oleiade/ref=
lections@v1.1.0/LICENSE;md5=3D545647f4ac07f51f9c46992f3bcf342a;spdx=3DMIT" =
rel=3D"noreferrer" target=3D"_blank">github.com/oleiade/reflections@v1.1.0/=
LICENSE;md5=3D545647f4ac07f51f9c46992f3bcf342a;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/open-policy=
-agent/opa@v1.14.1/LICENSE;md5=3Dfa818a259cbed7ce8bc2a22d35a464fc;spdx=3DAp=
ache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/open-policy-agent=
/opa@v1.14.1/LICENSE;md5=3Dfa818a259cbed7ce8bc2a22d35a464fc;spdx=3DApache-2=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/open-policy=
-agent/opa@v1.14.1/internal/edittree/bitvector/license.txt;md5=3D328867a460=
a981563d295f343199aad5;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_b=
lank">github.com/open-policy-agent/opa@v1.14.1/internal/edittree/bitvector/=
license.txt;md5=3D328867a460a981563d295f343199aad5;spdx=3DBSD-3-Clause</a> =
\<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/open-policy=
-agent/opa@v1.14.1/internal/gojsonschema/LICENSE-APACHE-2.0.txt;md5=3Df7a63=
12e0b85b17786de3ae15ab42bed;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D=
"_blank">github.com/open-policy-agent/opa@v1.14.1/internal/gojsonschema/LIC=
ENSE-APACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.=
0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/open-policy=
-agent/opa@v1.14.1/internal/semver/LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/o=
pen-policy-agent/opa@v1.14.1/internal/semver/LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/opencontain=
ers/go-digest@v1.0.0/LICENSE;md5=3D2d6fc0e85c3f118af64c85a78d56d3cf;spdx=3D=
Apache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/=
go-digest@v1.0.0/LICENSE;md5=3D2d6fc0e85c3f118af64c85a78d56d3cf;spdx=3DApac=
he-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/opencontain=
ers/image-spec@v1.1.1/LICENSE;md5=3D27ef03aa2da6e424307f102e8b42621d;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/opencontaine=
rs/image-spec@v1.1.1/LICENSE;md5=3D27ef03aa2da6e424307f102e8b42621d;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pborman/uui=
d@v1.2.1/LICENSE;md5=3D88073b6dd8ec00fe09da59e0b6dfded1;spdx=3DBSD-3-Clause=
" rel=3D"noreferrer" target=3D"_blank">github.com/pborman/uuid@v1.2.1/LICEN=
SE;md5=3D88073b6dd8ec00fe09da59e0b6dfded1;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pelletier/g=
o-toml/v2@v2.2.4/LICENSE;md5=3D390892c6562af0d807e527b06d635f94;spdx=3DMIT"=
 rel=3D"noreferrer" target=3D"_blank">github.com/pelletier/go-toml/v2@v2.2.=
4/LICENSE;md5=3D390892c6562af0d807e527b06d635f94;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pkg/browser=
@v0.0.0-20240102092130-5ac0b6a4141c/LICENSE;md5=3D2c6b03e6a9b13bd75b50a8dbe=
ed074da;spdx=3DBSD-2-Clause" rel=3D"noreferrer" target=3D"_blank">github.co=
m/pkg/browser@v0.0.0-20240102092130-5ac0b6a4141c/LICENSE;md5=3D2c6b03e6a9b1=
3bd75b50a8dbeed074da;spdx=3DBSD-2-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pkg/errors@=
v0.9.1/LICENSE;md5=3D6fe682a02df52c6653f33bd0f7126b5a;spdx=3DBSD-2-Clause" =
rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors@v0.9.1/LICENSE;m=
d5=3D6fe682a02df52c6653f33bd0f7126b5a;spdx=3DBSD-2-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/protocolbuf=
fers/txtpbfmt@v0.0.0-20260217160748-a481f6a22f94/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank=
">github.com/protocolbuffers/txtpbfmt@v0.0.0-20260217160748-a481f6a22f94/LI=
CENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/rcrowley/go=
-metrics@v0.0.0-20250401214520-65e299d6c5c9/LICENSE;md5=3D1bdf5d819f50f1413=
66dabce3be1460f;spdx=3DBSD-2-Clause" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/rcrowley/go-metrics@v0.0.0-20250401214520-65e299d6c5c9/LICENSE;md=
5=3D1bdf5d819f50f141366dabce3be1460f;spdx=3DBSD-2-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/rogpeppe/go=
-internal@v1.14.1/LICENSE;md5=3D02d4002e9171d41a8fad93aa7faf3956;spdx=3DBSD=
-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/rogpeppe/go-inte=
rnal@v1.14.1/LICENSE;md5=3D02d4002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Cl=
ause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/ryanuber/go=
-glob@v1.0.0/LICENSE;md5=3Dd2c81b3028eb947731a58fb068c7dff4;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/ryanuber/go-glob@v1.0.0/LICENS=
E;md5=3Dd2c81b3028eb947731a58fb068c7dff4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sagikazarma=
rk/locafero@v0.11.0/LICENSE;md5=3D6e63b3f726f4acaf0ce766e25bcdaf04;spdx=3DM=
IT" rel=3D"noreferrer" target=3D"_blank">github.com/sagikazarmark/locafero@=
v0.11.0/LICENSE;md5=3D6e63b3f726f4acaf0ce766e25bcdaf04;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sassoftware=
/relic@v7.2.1+incompatible/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;s=
pdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sassoftwa=
re/relic@v7.2.1+incompatible/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/secure-syst=
ems-lab/go-securesystemslib@v0.10.0/LICENSE;md5=3De9db53a054cb216b86f521253=
1da6b23;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/secure-=
systems-lab/go-securesystemslib@v0.10.0/LICENSE;md5=3De9db53a054cb216b86f52=
12531da6b23;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/shibumi/go-=
pathspec@v1.3.0/GO-LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=3DBS=
D-3-Clause" rel=3D"noreferrer" target=3D"_blank">github.com/shibumi/go-path=
spec@v1.3.0/GO-LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=3DBSD-3-=
Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/fu=
lcio@v1.8.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/fulcio@v1=
.8.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/pr=
otobuf-specs@v0.5.0/COPYRIGHT.txt;md5=3D79a0324a945372989ac53fa7813090a6;sp=
dx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/p=
rotobuf-specs@v0.5.0/COPYRIGHT.txt;md5=3D79a0324a945372989ac53fa7813090a6;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/re=
kor-tiles/v2@v2.2.1/COPYRIGHT.txt;md5=3Db52278561f2843315ac5021b4be699f5;sp=
dx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/r=
ekor-tiles/v2@v2.2.1/COPYRIGHT.txt;md5=3Db52278561f2843315ac5021b4be699f5;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/re=
kor@v1.5.1/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3DApac=
he-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/rekor@v1.5=
.1/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3DApache-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore/pkg/signature/kms/aws@v1.10.5/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com=
/sigstore/sigstore/pkg/signature/kms/aws@v1.10.5/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore/pkg/signature/kms/azure@v1.10.5/LICENSE;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.c=
om/sigstore/sigstore/pkg/signature/kms/azure@v1.10.5/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore/pkg/signature/kms/gcp@v1.10.5/LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com=
/sigstore/sigstore/pkg/signature/kms/gcp@v1.10.5/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore/pkg/signature/kms/hashivault@v1.10.5/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/sigstore/sigstore/pkg/signature/kms/hashivault@v1.10.5/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore-go@v1.1.4/COPYRIGHT.txt;md5=3D14403c66e6b22bac895a90b237ba9da0;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/sig=
store-go@v1.1.4/COPYRIGHT.txt;md5=3D14403c66e6b22bac895a90b237ba9da0;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/si=
gstore@v1.10.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3D=
Apache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/sigsto=
re@v1.10.5/COPYRIGHT.txt;md5=3D3830a9ca4f9dc30be01bfa2e4042dd46;spdx=3DApac=
he-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sigstore/ti=
mestamp-authority/v2@v2.0.5/COPYRIGHT.txt;md5=3Db658629ef1355c5c14f859e623e=
33da3;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/si=
gstore/timestamp-authority/v2@v2.0.5/COPYRIGHT.txt;md5=3Db658629ef1355c5c14=
f859e623e33da3;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sirupsen/lo=
grus@v1.9.4/LICENSE;md5=3D8dadfef729c08ec4e631c4f6fc5d43a0;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus@v1.9.4/LICENSE=
;md5=3D8dadfef729c08ec4e631c4f6fc5d43a0;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/sourcegraph=
/conc@v0.3.1-0.20240121214520-5f936abd7ae8/LICENSE;md5=3Dc001385e94f81477d7=
7ffaf4321c647d;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/=
sourcegraph/conc@v0.3.1-0.20240121214520-5f936abd7ae8/LICENSE;md5=3Dc001385=
e94f81477d77ffaf4321c647d;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/afero=
@v1.15.0/LICENSE.txt;md5=3D920d76114a32b0fb75b3f2718c5a91be;spdx=3DApache-2=
.0" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/afero@v1.15.0/LIC=
ENSE.txt;md5=3D920d76114a32b0fb75b3f2718c5a91be;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/cast@=
v1.10.0/LICENSE;md5=3D67fac7567cbf6ba946e5576d590b1ed4;spdx=3DMIT" rel=3D"n=
oreferrer" target=3D"_blank">github.com/spf13/cast@v1.10.0/LICENSE;md5=3D67=
fac7567cbf6ba946e5576d590b1ed4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/cobra=
@v1.10.2/LICENSE.txt;md5=3D920d76114a32b0fb75b3f2718c5a91be;spdx=3DApache-2=
.0" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra@v1.10.2/LIC=
ENSE.txt;md5=3D920d76114a32b0fb75b3f2718c5a91be;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/pflag=
@v1.0.10/LICENSE;md5=3D1e8b7dc8b906737639131047a590f21d;spdx=3DBSD-3-Clause=
" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/pflag@v1.0.10/LICEN=
SE;md5=3D1e8b7dc8b906737639131047a590f21d;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/viper=
@v1.21.0/LICENSE;md5=3D67fac7567cbf6ba946e5576d590b1ed4;spdx=3DMIT" rel=3D"=
noreferrer" target=3D"_blank">github.com/spf13/viper@v1.21.0/LICENSE;md5=3D=
67fac7567cbf6ba946e5576d590b1ed4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spiffe/go-s=
piffe/v2@v2.6.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApach=
e-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/spiffe/go-spiffe/v2@=
v2.6.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/subosito/go=
tenv@v1.6.0/LICENSE;md5=3D0873257f40b8747d351ccc4288d06a40;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/subosito/gotenv@v1.6.0/LICENSE=
;md5=3D0873257f40b8747d351ccc4288d06a40;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/syndtr/gole=
veldb@v1.0.1-0.20220721030215-126854af5e6d/LICENSE;md5=3D6b6b03a3c410317c55=
8abe499de9b5a7;spdx=3DBSD-2-Clause" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/syndtr/goleveldb@v1.0.1-0.20220721030215-126854af5e6d/LICENSE;md5=
=3D6b6b03a3c410317c558abe499de9b5a7;spdx=3DBSD-2-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/tchap/go-pa=
tricia/v2@v2.3.3/LICENSE;md5=3D9949b99212edd6b1e24ce702376c3baf;spdx=3DMIT"=
 rel=3D"noreferrer" target=3D"_blank">github.com/tchap/go-patricia/v2@v2.3.=
3/LICENSE;md5=3D9949b99212edd6b1e24ce702376c3baf;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/theupdatefr=
amework/go-tuf/v2@v2.4.1/LICENSE;md5=3D7da0b6aed5e17caf37a82737f6ea8bae;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/theupdatefr=
amework/go-tuf/v2@v2.4.1/LICENSE;md5=3D7da0b6aed5e17caf37a82737f6ea8bae;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/theupdatefr=
amework/go-tuf@v0.7.0/LICENSE;md5=3Dda2aa24617ab5e82d2256f542bd06903;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/theupdatefra=
mework/go-tuf@v0.7.0/LICENSE;md5=3Dda2aa24617ab5e82d2256f542bd06903;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/titanous/ro=
cacheck@v0.0.0-20171023193734-afe73141d399/LICENSE;md5=3D6466139830f9cc7a38=
8f07b29b2c65ce;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/=
titanous/rocacheck@v0.0.0-20171023193734-afe73141d399/LICENSE;md5=3D6466139=
830f9cc7a388f07b29b2c65ce;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/tjfoc/gmsm@=
v1.4.1/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0" re=
l=3D"noreferrer" target=3D"_blank">github.com/tjfoc/gmsm@v1.4.1/LICENSE;md5=
=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/transparenc=
y-dev/formats@v0.0.0-20251017110053-404c0d5b696c/LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank=
">github.com/transparency-dev/formats@v0.0.0-20251017110053-404c0d5b696c/LI=
CENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/transparenc=
y-dev/merkle@v0.0.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DA=
pache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/transparency-dev=
/merkle@v0.0.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache=
-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/valyala/fas=
tjson@v1.6.7/LICENSE;md5=3D7780bf961575e8d21fbfb56f09632be7;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">github.com/valyala/fastjson@v1.6.7/LICENS=
E;md5=3D7780bf961575e8d21fbfb56f09632be7;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/vbatts/tar-=
split@v0.12.2/LICENSE;md5=3D19cd0ecd0a6c26052aec628b72e72881;spdx=3DBSD-3-C=
lause" rel=3D"noreferrer" target=3D"_blank">github.com/vbatts/tar-split@v0.=
12.2/LICENSE;md5=3D19cd0ecd0a6c26052aec628b72e72881;spdx=3DBSD-3-Clause</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/vektah/gqlp=
arser/v2@v2.5.32/LICENSE;md5=3De2f8bb50fb8654dc33b36e08a6c85219;spdx=3DMIT"=
 rel=3D"noreferrer" target=3D"_blank">github.com/vektah/gqlparser/v2@v2.5.3=
2/LICENSE;md5=3De2f8bb50fb8654dc33b36e08a6c85219;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/withfig/aut=
ocomplete-tools/integrations/cobra@v1.2.1/LICENSE;md5=3D6f8b2298f7dd18005ca=
e2ec735eba325;spdx=3DMIT" rel=3D"noreferrer" target=3D"_blank">github.com/w=
ithfig/autocomplete-tools/integrations/cobra@v1.2.1/LICENSE;md5=3D6f8b2298f=
7dd18005cae2ec735eba325;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/x448/float1=
6@v0.8.4/LICENSE;md5=3Dde8f8e025d57fe7ee0b67f30d571323b;spdx=3DMIT" rel=3D"=
noreferrer" target=3D"_blank">github.com/x448/float16@v0.8.4/LICENSE;md5=3D=
de8f8e025d57fe7ee0b67f30d571323b;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/xeipuuv/goj=
sonpointer@v0.0.0-20190905194746-02993c407bfb/LICENSE-APACHE-2.0.txt;md5=3D=
f7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.0" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/xeipuuv/gojsonpointer@v0.0.0-20190905194746-02993c=
407bfb/LICENSE-APACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=
=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/xeipuuv/goj=
sonreference@v0.0.0-20180127040603-bd5ef7bd5415/LICENSE-APACHE-2.0.txt;md5=
=3Df7a6312e0b85b17786de3ae15ab42bed;spdx=3DApache-2.0" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/xeipuuv/gojsonreference@v0.0.0-20180127040603-b=
d5ef7bd5415/LICENSE-APACHE-2.0.txt;md5=3Df7a6312e0b85b17786de3ae15ab42bed;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/yashtewari/=
glob-intersection@v0.2.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spd=
x=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">github.com/yashtewari/=
glob-intersection@v0.2.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spd=
x=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gitlab.com/gitlab-org/=
api/client-go@v1.46.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">gitlab.com/gitlab-org/a=
pi/client-go@v1.46.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/au=
to/sdk@v1.2.1/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-=
2.0" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/auto/sdk@v1.2=
.1/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/co=
ntrib/instrumentation/google.golang.org/grpc/otelgrpc@v0.63.0/LICENSE;md5=
=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0" rel=3D"noreferrer" t=
arget=3D"_blank">go.opentelemetry.io/contrib/instrumentation/google.golang.=
org/grpc/otelgrpc@v0.63.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;sp=
dx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/co=
ntrib/instrumentation/net/http/otelhttp@v0.65.0/LICENSE;md5=3D24dad3abbe7a8=
f390afc8ab967bfefa7;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank"=
>go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.65.0/LICE=
NSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/ot=
el/metric@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApa=
che-2.0" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/metr=
ic@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/ot=
el/trace@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApac=
he-2.0" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/trace=
@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.opentelemetry.io/ot=
el@v1.41.0/LICENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel@v1.41.0/LIC=
ENSE;md5=3D24dad3abbe7a8f390afc8ab967bfefa7;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.uber.org/multierr@v=
1.11.0/LICENSE.txt;md5=3D721ac51ede11efb667ff53a866be23c4;spdx=3DMIT" rel=
=3D"noreferrer" target=3D"_blank">go.uber.org/multierr@v1.11.0/LICENSE.txt;=
md5=3D721ac51ede11efb667ff53a866be23c4;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.uber.org/zap@v1.27.=
1/LICENSE;md5=3Da48e22dd4170c1eb095a423a50302852;spdx=3DMIT" rel=3D"norefer=
rer" target=3D"_blank">go.uber.org/zap@v1.27.1/LICENSE;md5=3Da48e22dd4170c1=
eb095a423a50302852;spdx=3DMIT</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.yaml.in/yaml/v2@v2.=
4.3/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0" rel=
=3D"noreferrer" target=3D"_blank">go.yaml.in/yaml/v2@v2.4.3/LICENSE;md5=3De=
3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://go.yaml.in/yaml/v3@v3.=
0.4/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c;spdx=3DApache-2.0" rel=
=3D"noreferrer" target=3D"_blank">go.yaml.in/yaml/v3@v3.0.4/LICENSE;md5=3D3=
c91c17266710e16afdbb2b6d15c761c;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/crypto@v0=
.49.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/crypto@v0.49.0/LICENSE;md5=
=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/mod@v0.34=
.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/mod@v0.34.0/LICENSE;md5=3D79=
98cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/net@v0.52=
.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net@v0.52.0/LICENSE;md5=3D79=
98cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/oauth2@v0=
.36.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2@v0.36.0/LICENSE;md5=
=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/sync@v0.2=
0.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync@v0.20.0/LICENSE;md5=3D7=
998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/sys@v0.42=
.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys@v0.42.0/LICENSE;md5=3D79=
98cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/term@v0.4=
1.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term@v0.41.0/LICENSE;md5=3D7=
998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/text@v0.3=
5.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text@v0.35.0/LICENSE;md5=3D7=
998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/time@v0.1=
5.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/time@v0.15.0/LICENSE;md5=3D7=
998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/api@=
v0.269.0/LICENSE;md5=3Da651bb3d8b1c412632e28823bb432b40;spdx=3DBSD-3-Clause=
" rel=3D"noreferrer" target=3D"_blank">google.golang.org/api@v0.269.0/LICEN=
SE;md5=3Da651bb3d8b1c412632e28823bb432b40;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/api@=
v0.269.0/internal/third_party/uritemplates/LICENSE;md5=3D4ee4feb2b545c22317=
49e5c54ace343e;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">go=
ogle.golang.org/api@v0.269.0/internal/third_party/uritemplates/LICENSE;md5=
=3D4ee4feb2b545c2231749e5c54ace343e;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/genp=
roto/googleapis/api@v0.0.0-20260203192932-546029d2fa20/LICENSE;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"=
_blank">google.golang.org/genproto/googleapis/api@v0.0.0-20260203192932-546=
029d2fa20/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/genp=
roto/googleapis/rpc@v0.0.0-20260217215200-42d3e9bedb6d/LICENSE;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"=
_blank">google.golang.org/genproto/googleapis/rpc@v0.0.0-20260217215200-42d=
3e9bedb6d/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/genp=
roto@v0.0.0-20260128011058-8636f8732409/LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">google.=
golang.org/genproto@v0.0.0-20260128011058-8636f8732409/LICENSE;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/grpc=
@v1.80.0/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc@v1.80.0/LICENSE=
;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://google.golang.org/prot=
obuf@v1.36.11/LICENSE;md5=3D02d4002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-C=
lause" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf@v1.3=
6.11/LICENSE;md5=3D02d4002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Clause</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/evanphx/json-=
patch.v4@v4.13.0/LICENSE;md5=3D96ae735ca1b4dcdb6b26f4ca4b8ba645;spdx=3DBSD-=
3-Clause" rel=3D"noreferrer" target=3D"_blank">gopkg.in/evanphx/json-patch.=
v4@v4.13.0/LICENSE;md5=3D96ae735ca1b4dcdb6b26f4ca4b8ba645;spdx=3DBSD-3-Clau=
se</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/inf.v0@v0.9.1=
/LICENSE;md5=3D13cea479df204c85485b5db6eb1bc9d5;spdx=3DBSD-3-Clause" rel=3D=
"noreferrer" target=3D"_blank">gopkg.in/inf.v0@v0.9.1/LICENSE;md5=3D13cea47=
9df204c85485b5db6eb1bc9d5;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/ini.v1@v1.67.=
1/LICENSE;md5=3D4e2a8d8f9935d6a766a5879a77ddc24d;spdx=3DApache-2.0" rel=3D"=
noreferrer" target=3D"_blank">gopkg.in/ini.v1@v1.67.1/LICENSE;md5=3D4e2a8d8=
f9935d6a766a5879a77ddc24d;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/yaml.v3@v3.0.=
1/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c;spdx=3DApache-2.0" rel=3D"=
noreferrer" target=3D"_blank">gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3D3c91c17=
266710e16afdbb2b6d15c761c;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/api@v0.35.3/LIC=
ENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noref=
errer" target=3D"_blank">k8s.io/api@v0.35.3/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/apimachinery@v0=
.35.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=
=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery@v0.35.3/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/apimachinery@v0=
.35.3/third_party/forked/golang/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707;spdx=3DBSD-3-Clause" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimac=
hinery@v0.35.3/third_party/forked/golang/LICENSE;md5=3D5d4950ecb7b26d2c5e4e=
7b4e0dd74707;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/client-go@v0.35=
.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D=
"noreferrer" target=3D"_blank">k8s.io/client-go@v0.35.3/LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/klog/v2@v2.130.=
1/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApache-2.0" rel=3D"=
noreferrer" target=3D"_blank">k8s.io/klog/v2@v2.130.1/LICENSE;md5=3D19cbd64=
715b51267a47bf3750cc6a8a5;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/kube-openapi@v0=
.0.0-20250910181357-589584f1c912/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">k8s.io/kube-op=
enapi@v0.0.0-20250910181357-589584f1c912/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/kube-openapi@v0=
.0.0-20250910181357-589584f1c912/pkg/internal/third_party/go-json-experimen=
t/json/LICENSE;md5=3D9d210c7471ce08e3db5261f33bf8fce6;spdx=3DBSD-3-Clause" =
rel=3D"noreferrer" target=3D"_blank">k8s.io/kube-openapi@v0.0.0-20250910181=
357-589584f1c912/pkg/internal/third_party/go-json-experiment/json/LICENSE;m=
d5=3D9d210c7471ce08e3db5261f33bf8fce6;spdx=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/kube-openapi@v0=
.0.0-20250910181357-589584f1c912/pkg/validation/spec/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_b=
lank">k8s.io/kube-openapi@v0.0.0-20250910181357-589584f1c912/pkg/validation=
/spec/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0</a> =
\<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/utils@v0.0.0-20=
251002143259-bc988d571ff4/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;sp=
dx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">k8s.io/utils@v0.0.0-2=
0251002143259-bc988d571ff4/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;s=
pdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://k8s.io/utils@v0.0.0-20=
251002143259-bc988d571ff4/internal/third_party/forked/golang/LICENSE;md5=3D=
591778525c869cdde0ab5a1bf283cd81;spdx=3DBSD-3-Clause" rel=3D"noreferrer" ta=
rget=3D"_blank">k8s.io/utils@v0.0.0-20251002143259-bc988d571ff4/internal/th=
ird_party/forked/golang/LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81;spdx=
=3DBSD-3-Clause</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://sigs.k8s.io/json@v0.0.=
0-20250730193827-2d320260d730/LICENSE;md5=3D545d3f23616dee7495323aeb0b098df=
3;spdx=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/json@=
v0.0.0-20250730193827-2d320260d730/LICENSE;md5=3D545d3f23616dee7495323aeb0b=
098df3;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://sigs.k8s.io/randfill@v=
1.0.0/LICENSE;md5=3D8f245a894b7d4f5880176fafd88faad8;spdx=3DApache-2.0" rel=
=3D"noreferrer" target=3D"_blank">sigs.k8s.io/randfill@v1.0.0/LICENSE;md5=
=3D8f245a894b7d4f5880176fafd88faad8;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://sigs.k8s.io/release-ut=
ils@v0.12.4/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.=
0" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/release-utils@v0.12.4/L=
ICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://sigs.k8s.io/structured=
-merge-diff/v6@v6.3.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=
=3DApache-2.0" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/structured-=
merge-diff/v6@v6.3.0/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3D=
Apache-2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://sigs.k8s.io/yaml@v1.6.=
0/LICENSE;md5=3Db5d30dd5bc47d1b56b678ac06dead1c7;spdx=3DMIT" rel=3D"norefer=
rer" target=3D"_blank">sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=3Db5d30dd5bc47d1=
b56b678ac06dead1c7;spdx=3DMIT</a> \<br>
&gt; +&quot;<br>
&gt; diff --git a/recipes-containers/cosign/<a href=3D"http://cosign_git.bb=
" rel=3D"noreferrer" target=3D"_blank">cosign_git.bb</a> b/recipes-containe=
rs/cosign/<a href=3D"http://cosign_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">cosign_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000..09c28317<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/cosign/<a href=3D"http://cosign_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cosign_git.bb</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +SUMMARY =3D &quot;Container signing, verification and storage in an O=
CI registry&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/sigstore/cosign" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/sigstore/cosign</a>&qu=
ot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/COPYRIGHT.txt;md5=
=3D3830a9ca4f9dc30be01bfa2e4042dd46 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://src/${GO_IMPORT}/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>
&gt; +<br>
&gt; +GO_IMPORT =3D &quot;<a href=3D"http://github.com/sigstore/cosign" rel=
=3D"noreferrer" target=3D"_blank">github.com/sigstore/cosign</a>&quot;<br>
&gt; +GO_INSTALL =3D &quot;${GO_IMPORT}/v3/cmd/cosign&quot;<br>
&gt; +SRC_URI =3D &quot;git://${GO_IMPORT};protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${GO_SRCURI_DESTSUFFIX}&quot;<br>
&gt; +PV =3D &quot;3.0.6+git&quot;<br>
&gt; +SRCREV =3D &quot;f1ad3ee952313be5d74a49d67ba0aa8d0d5e351f&quot;<br>
&gt; +<br>
&gt; +require ${BPN}-licenses.inc<br>
&gt; +require ${BPN}-go-mods.inc<br>
&gt; +<br>
&gt; +inherit go-mod go-mod-update-modules<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; -- <br>
&gt; 2.50.1 (Apple Git-155)<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9745): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9745" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9745</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11899179=
3/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/118991793/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000eb58ae06508620ab--

