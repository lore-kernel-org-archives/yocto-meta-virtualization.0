Return-Path: <ierturk@ieee.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F07C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:24:39 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.17193.1658906676562816860
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 00:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ieee.org header.s=google header.b=dbXcEXvo;
 spf=pass (domain: ieee.org, ip: 209.85.208.54, mailfrom: ierturk@ieee.org)
Received: by mail-ed1-f54.google.com with SMTP id u12so15264323edd.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=from:content-transfer-encoding:mime-version:subject:message-id
         :references:to:date;
        bh=xUBXRxF1tdF0Ah+tNSeyFH/zpu4NttHl1Q53wuNuE1g=;
        b=dbXcEXvoXugrYTPTt9S7GrgKNYt5Zty4morTLQ1HWTXrsyaZLdmNDxONb9WEbpf0Sc
         wKV2TIN1mIS6qiwhPa0ze23X5Sahezc6D+oLVf+1EOLJ4dxsxWIP9wtewjoba0MsVX03
         4s4xNN/ky6D4PisnzoqoyXKdxtizqk3KjjjEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:references:to:date;
        bh=xUBXRxF1tdF0Ah+tNSeyFH/zpu4NttHl1Q53wuNuE1g=;
        b=KfBbP7Y+w7aU9S1+fWZ7xCllgiXrxDNNVMFswaorqGvZFtVcaAN5Uh8zcWYVFlT311
         JBt823nE4BwOpMShlA1VXSPAxs812V6h3OuFmuLXE2+kjtUf9GSyeXd3iEz3QQcw/AQG
         tMxr9XRR/Ror43cmQ5nvIJY91YocJsiKx147hkKkAGW/xhj8LSNYgUFaE9qdiiV1XKgP
         pGyddEwG7HMVhSo8J1+KaAvUaU9vtxkYd+LAqhbHO6pXISa/asUCvpV0GG/flyAkmt10
         75SJZ7i1TdNt2r5eYmNkU45Who0rTbyRjFQ8GFNqC3tAzRVuGwvk0aECl+u9c9xLswom
         ruYw==
X-Gm-Message-State: AJIora8I9/94QoUd/dGIRAAIQesOavDhJ3RMFbY45rtO4C2fuUIYN9WV
	laAHo8mZjmELx6L+a2Z+gvHZfTgXWqgDYPKpoYBEFv0mIJ70VtTcXxIQE03pyPN/bXRxZBCiebF
	4gISk0RfarisP2UQDU2qkZn6eGC85Q/E+6CnoavWqAdyMhd1iC3nYdVNL46cHkpIERh1DfMAAbD
	8kJ/Afn7m8yEiANro=
X-Google-Smtp-Source: 
 AGRyM1viXYeGvqs5uo8JaB2ogySvVFGa3YNBEPvCPyvw4K+WJDXu/1pvd/CFSzsYGOQ0UqaMOEb15w==
X-Received: by 2002:a05:6402:5245:b0:43a:a024:82cc with SMTP id
 t5-20020a056402524500b0043aa02482ccmr21744180edd.56.1658906674545;
        Wed, 27 Jul 2022 00:24:34 -0700 (PDT)
Received: from [192.168.1.21] ([92.44.144.181])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b006fed93bf71fsm7294043ejg.18.2022.07.27.00.24.34
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:24:34 -0700 (PDT)
From: Ibrahim Erturk <ierturk@ieee.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Docker Compose issue regarding the deprecation of Python3 distutils
 on Kirkstone
Message-Id: <49660EA1-CD22-40DB-98C7-C43F38A72CCA@ieee.org>
References: <BF86DE9A-16AF-4423-95B0-3FFF3ED5A9CD@ieee.org>
To: meta-virtualization@lists.yoctoproject.org
Date: Wed, 27 Jul 2022 10:24:32 +0300
X-Mailer: Apple Mail (2.3608.120.23.2.7)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 07:24:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7476

Hello,

I added the following line into local.conf to get the packages docker =
and docker-compose on Rapberry Pi (meta-raspberrypi) with the branch =
kirkstone.

# Virtualization
DISTRO_FEATURES:append =3D " virtualization"
IMAGE_INSTALL:append =3D " docker-ce"
IMAGE_INSTALL:append =3D " python3-docker-compose=E2=80=9D
# IMAGE_INSTALL:append =3D " python3-distutils"

However, due to python3-distutils deprecated as of Python3.10, I got the =
following error.

raspberrypi3:~$ docker-compose
Traceback (most recent call last):
 File "/usr/bin/docker-compose", line 5, in <module>
   from compose.cli.main import main
 File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, =
in <module>
   from distutils.spawn import find_executable
ModuleNotFoundError: No module named =E2=80=98distutils=E2=80=99

Is there any workaround regarding this issue or am I missing some =
configuration?

Thanks in advance.

Regards,
Ibrahim ERTURK=

