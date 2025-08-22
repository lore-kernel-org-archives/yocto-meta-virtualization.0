Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757E6CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 00:45:26 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.4574.1755823519403508488
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 17:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R4OYMXOE;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: joaohf@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e931cbd34d5so172919276.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Aug 2025 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755823518; x=1756428318; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OG001JfsNgHojhm+TEwzKk4S1OpAExxRWvLDNmuVA1M=;
        b=R4OYMXOEFANCHM3UlgcuvsWTZOn4K5DR2rGurMYf2z1TiMNwqDjpWol9O0cnw++uXG
         oIkhFHUxxzd8WYMagahvv/WYA5vX65Di6AtA6N2bItuNhjTDRTUSDZ50UAVtSe31c8Kz
         yQLtaI/m+UffiqhqDILJ+RHpdNNNE2qgvTni8EY6iVm+jvQiToFrk9E1/XYhtKP7aByz
         lnVNrNJvKuABxlCPNQsWCTlm8kc0C7S2RtPTJeCCE/my96HyceZZ7HfSILSeK6HNDiuW
         ohOOy9uR6UtbMO7yAyTrdz9Vr6+y+S5bdXOHjXUzFn9QpOkoj/7ovkzLqu5a/RZEqU+l
         nGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755823518; x=1756428318;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OG001JfsNgHojhm+TEwzKk4S1OpAExxRWvLDNmuVA1M=;
        b=v0zy9AxPPcviaS0ki0QppwVqRfZenY3Ph9gY5Gr7CIBV0cLH89BVrV2RrRFoOXQlqF
         g6NUpmVtW5x6yxWfnTd+tDEQoJFPu+4aOWU2YJ1ePsJu0qhCp4x1GSvKKVk29Na2s8PD
         BpG0YBoQ4myk/+TS/s7GJW3kuQoDppbsjpvpFZSAqhQYtkYY2bRaMmBurlh+adCxohjr
         szJlvEXM4wdW3HDhLZ1bnckAsNLSlok1vHUcRw5PERpqCuFZYMrq4Lcj3g5Dz/bnOZsL
         90xu7k6JfLgRLQZS7YgX1pb7uloSBEmCEWZqnsppYzZWkenyuedjdvaKrHw8IyEWNBmw
         3IOQ==
X-Gm-Message-State: AOJu0YwibP85K+/dljqOOIKqqpk4XN7MBhMRwAWcyEpPWptjLTF8yDA7
	pmnsCquKl+Rz68jfZKh4SjjVu9vXS2PFekSQW1oM7UkPH13Ot2ChE0+zyxthnz5AheZP1TiXaGq
	WRfzC0+QFT2eEBSrKHQmkPoMquG3L1XJ5N8mzGT8=
X-Gm-Gg: ASbGncvfs+0El/S8HTlzvvm3CqkePWMsxHxLVXK460Wy42eLVoHC2R08/6sDgTThWUs
	X9lzWLLPlbD+yFr2sjy9Y35Dgtte6/WOtWOE3gwsx9bPYwJCzg+7ArmrLdGK4nFTn72kF9zEQbb
	tJG3v1FuO6UZ+0swhy11deUvP8AmCohBphmWbokZpG2e0GYq72oE7fqV23+PHCFHENir8Kek6gP
	B/HY2D3pIkAFUwStN0=
X-Google-Smtp-Source: AGHT+IHP3gEemWAgXo0XQiyoI2D0cV7GSQxsjby8zq20zJTRISkGMGQdgFPFAoM3i3ulmkFID5ouCKF6dZGxn29KlvA=
X-Received: by 2002:a05:690c:46ca:b0:711:908e:37b2 with SMTP id
 00721157ae682-71fdc2c74e2mr8161027b3.2.1755823517941; Thu, 21 Aug 2025
 17:45:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Thu, 21 Aug 2025 21:45:06 -0300
X-Gm-Features: Ac12FXyb40aS49uCAi_qgk5dqslXNXdcWQiYqsQkqEk2cNrJudVSdKjq16uyXc4
Message-ID: <CANFVK79QdSO79V83OZW2ZoFC-Ey76Ypb+9BAFvg4Ko7v5rg89w@mail.gmail.com>
Subject: About rabbitmq (from meta-erlang) for meta-openstack
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000134614063ce98548"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Aug 2025 00:45:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9354

--000000000000134614063ce98548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I don't know if this list is the right place to discuss about
meta-cloud-services/meta-openstack.
The README from meta-openstack says here is the place.

So, I'm the maintainer of meta-erlang layer and as meta-openstack uses
rabbitmq-server from meta-erlang, I should say some words here.

I'm planning the following changes on master branch:

- rabbitmq-server: update from 3.11.28 to 4.1.3, trying to minimize the
number of erlang-modules installed. Because I suspect the rabbitmq-server
recipe is installing too much.

- implement some imagetests to test basic rabbitmq features.

I want to know if it's ok to meta-openstack users with the plan above. And
if 4.1.3 is compatible with the current meta-openstack version.

Thanks

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--000000000000134614063ce98548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-gI"><span><br></span></span></di=
v><div><span class=3D"gmail-gI"><span>Hi,</span></span></div><div><span cla=
ss=3D"gmail-gI"><span><br></span></span></div><div><span class=3D"gmail-gI"=
><span>I don&#39;t know if this list is the right place to discuss about=C2=
=A0</span></span>meta-cloud-services/meta-openstack. The README from meta-o=
penstack says here is the place.</div><div><br></div><div><span class=3D"gm=
ail-gI"><span>So, I&#39;m the maintainer of meta-erlang layer and as meta-o=
penstack uses rabbitmq-server from meta-erlang, I should say some words her=
e.</span></span></div><div><span class=3D"gmail-gI"><span><br></span></span=
></div><div><span class=3D"gmail-gI"><span>I&#39;m planning the following c=
hanges on master branch:</span></span></div><div><span class=3D"gmail-gI"><=
span>=C2=A0</span></span></div><div><span class=3D"gmail-gI"><span>- rabbit=
mq-server: update from=C2=A0</span></span>3.11.28 to=C2=A04.1.3, trying to =
minimize the number of erlang-modules installed. Because I suspect the rabb=
itmq-server recipe is installing too much.</div><div><br></div><div>- imple=
ment some imagetests=C2=A0to test basic rabbitmq features.</div><div><br></=
div><div>I want to know if it&#39;s ok to meta-openstack users with the pla=
n above. And if 4.1.3 is compatible with the current meta-openstack version=
.</div><div><br></div><div>Thanks</div><br><span class=3D"gmail_signature_p=
refix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Fre=
itas - <a href=3D"http://joaohf_at_gmail.com" target=3D"_blank">joaohf_at_g=
mail.com</a><br>Campinas-SP-Brasil</div></div></div>

--000000000000134614063ce98548--

