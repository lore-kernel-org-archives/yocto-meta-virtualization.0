Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA7AC47088
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 21:46:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.131751.1669672001504193916
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 13:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cllRtQEC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x2so17318640edd.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 13:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fs4upj3XtfL+hAKY7fpSCYsxk6TqGXP5cdxz1Yk+uzA=;
        b=cllRtQECEMQ+ZvVDj3DtcEoOC2q/K/KlhJb2idOTV59zsdsyo+Y0ZMBbdreTo2uvT1
         z/NbFpbC+OfS9aTemW/1Or0wJwxNXt5ouBnbuB8uruq5D0oGpF77PeFoUb+zc6Q6pS7I
         iP3u5S1cbSgruGMr618YUuqEPKR4/IWc94qbZuFb/0RjvAbiQr9xzaZLOQbWSKtsKGoe
         DkED5JXAo0B7CzCnxD/PL9Db4x7K7yXq3uDobZvV8r/wjZ8YBVQy19fU06QWkPH8iYcz
         r/zCskqFLbOmv6+we3lGRuWavH45D57DKwXCszjjpH3pQ0TW31zmID/+aYCjeMq1i44k
         vKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs4upj3XtfL+hAKY7fpSCYsxk6TqGXP5cdxz1Yk+uzA=;
        b=sq05R06ej8HMfQOpO0gIvDl+i+HEwww3c002u6KfoTUnC2I6T9pMMPUzNlF4uD2mos
         LY9KqEme3okBkpiQVMs/68OwZEzXzsOquyA7+WHwce5o9IEyJkNTTqb2JMttVWzx9ssT
         li/FoBGC3zGS5baCBxGcvVl8qwl8Y/muLke7LHTfz6gje/uH/ZPbC50n5l/RI7ME0Gzk
         JcJ/jGGTUkOzdxLCcE2poiYqSOce4uhYjfiqmCyIKmBpbEyrRonpyHGQRRFhkhSsfmP/
         MKuFe25EIkO8u3v2ayX1OPeTZ+BnmE9k0vzXkRxKuEMXrn/Yba2C0IOt5irS8JwQ7hSM
         cEjA==
X-Gm-Message-State: ANoB5pmOv16n2aILwrGDJ+HFlzQ8bY73DCEneeir/bvNC86DKaAoP6Tq
	SS/qoOHBHcIv7wzvzXTvia/UJbBQkk4=
X-Google-Smtp-Source: AA0mqf6u221OAf22NEVSey+6mexJWDOqRKKQrSoAKgJyr5UGJbMWcreHDJ45MopsEVzUHz1KISrCXw==
X-Received: by 2002:a05:6402:181:b0:461:ea0c:e151 with SMTP id r1-20020a056402018100b00461ea0ce151mr34732600edv.376.1669671999595;
        Mon, 28 Nov 2022 13:46:39 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b0073d7ab84375sm5442231ejc.92.2022.11.28.13.46.39
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 13:46:39 -0800 (PST)
Message-ID: <49b1aa12228d4e7ea8d0a3784c72bfd935f75042.camel@gmail.com>
Subject: docker 20.10.21 from master-next
From: adrian.freihofer@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Date: Mon, 28 Nov 2022 22:46:37 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 21:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7700

Hi Bruce

Three comments regarding the docker 20.10.21 recipes on master-next:

 * Could the DEPENDS be reduced to the follwoing list? I guess all
   other dependencies (the go stuff) are taken from  the vendor folder
   anyway. It's at least working for me like that:
  =20
   DEPENDS =3D " \
      libtool-native \
      libtool \
   "

 * The CVE_PRODUCT should probably be changed to:
  =20
   CVE_PRODUCT =3D "mobyproject:moby"
  =20
   With docker e.g. CVE-2022-36109 is not reported by cve_check but
   with mobyproject:moby it works as expected.
   Im not 100% sure if mobyproject:moby covers also CVEs in libnetwork
   and the cli which are separate repositories.
 * The default PACKAGECONFIG could consider the seccomp DISTRO_FEATURE:
   ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '',)}=20
  =20
Of course I can send you a patch but I guess you would prefer to
quickly do it on your own since you already started with the update and
you usually reject patches against your current work in progress. Hope
this is helpful. Otherwise let me know.

Thank you and regards,
Adrian


