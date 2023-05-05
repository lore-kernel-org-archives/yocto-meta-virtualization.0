Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6B1C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:14:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.31989.1683303247630905615
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 May 2023 09:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dfhAs96b;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f3331f928cso14164305e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 May 2023 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683303246; x=1685895246;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+f+7BYC0uIz6oohBWQEU4ORdGNnT0LXapncHydW7eu8=;
        b=dfhAs96bfJBvDK3YfoinDfvxvCTe9ZQujm3RiAcF4O3Ae4lX7VchOFQGsYzhtJDG2n
         6YSDT72d4U1mNBqDmPyYvI9ps5AHArFgbmJhstrJNn9XbKT926dufCwKphMwbubsbj1s
         Dkfu5qZ2Km1r8qyjcZU+fHELIBvB7fzMS1lDYpV08A0ESnPv+9SHaxFSmmuOg36S1li+
         e0rm0vVAJqtLbn1/wc9JNo9MrWpMkuM/G13+e+Y7fSF5OPayQuQ1rRxRIdfCos3kbKtk
         f3T8VCQ6EH4IW0q1SqfIvtlyRTz8d68wHc1ZuuH/gj+z68pW2TW2nanWM67/APLs61c2
         +XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683303246; x=1685895246;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+f+7BYC0uIz6oohBWQEU4ORdGNnT0LXapncHydW7eu8=;
        b=Jha6IapZgrMoQ6kfUcO2cmakAJQEbTElC5rWiK+05mIk0NTOzgme8VBfz7kqaFRw+Y
         z/pTEcBkq07ZnoaT9hXoImSFs9DeLjbsDCUq31jJ4AtA6HhyjAkQ+s9ydcop0Vda94W8
         5a628VhBU714T3ILw0yTkzM+a6n5MQOZ7L5YiMQbITJBZtr53qcLGQw+sfwufPTdKE6p
         wTvnC+rOvU5yGeV348oU4qjYJ+57P/fN6huO2atmxXWAuPqSt/g4oCxWfket5sIXaOqm
         jIVpO9pq1iS2Z9nBZDzoQ+z8Vlq2XXrIEhwoWrT3wQ9vLEZUvK5HzLbnVXBp8NyA81Lz
         04DQ==
X-Gm-Message-State: AC+VfDx8POpcnM1uVsBoA38KsUCW6ipGQaK8EAw+Cj9B3/RPeagGCMVd
	IFfQijo5RXvC8jiZ53k5C510KxFAORdtQrW6H1aj9MB8iUI=
X-Google-Smtp-Source: ACHHUZ4GdInYS81BQYZclUUpxsVlyHyWeqAzVSdvfsxroTglLqT3XnBlSGJMyzqmLH0IWyz3e1LeMXu+MJtSRcHx9SA=
X-Received: by 2002:a1c:ed13:0:b0:3f1:6fb3:ffd4 with SMTP id
 l19-20020a1ced13000000b003f16fb3ffd4mr1411875wmh.6.1683303245868; Fri, 05 May
 2023 09:14:05 -0700 (PDT)
MIME-Version: 1.0
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 May 2023 18:13:50 +0200
Message-ID: <CA+chaQe3V5r0SXWvtMTLo6T8v_G8CFwCMe8Vj+gLWydi5AK7SA@mail.gmail.com>
Subject: yq fails to compile on yocto for aarch64
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000004f31105faf49466"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 May 2023 16:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8047

--00000000000004f31105faf49466
Content-Type: text/plain; charset="UTF-8"

Hi,

just FYI, I was looking at one of last build failures in my world builds
and yq is failing again for aarch64.

Looks like the issue is in go itself:
https://github.com/golang/go/issues/58826

and should be fixed whenever we upgrade to 1.20.3 (
https://github.com/golang/go/issues?q=milestone%3AGo1.20.3+label%3ACherryPickApproved
with https://github.com/golang/go/issues/58920) oe-core/master currently
has 1.20.1.

Regards,

--00000000000004f31105faf49466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>just FYI, I was looking at one of l=
ast build failures in my world builds and yq is failing again for aarch64.<=
/div><div><br></div><div>Looks like the issue is in go itself:</div><div><a=
 href=3D"https://github.com/golang/go/issues/58826">https://github.com/gola=
ng/go/issues/58826</a><br></div><div><br></div><div>and should be fixed whe=
never we upgrade to 1.20.3 (<a href=3D"https://github.com/golang/go/issues?=
q=3Dmilestone%3AGo1.20.3+label%3ACherryPickApproved">https://github.com/gol=
ang/go/issues?q=3Dmilestone%3AGo1.20.3+label%3ACherryPickApproved</a> with =
<a href=3D"https://github.com/golang/go/issues/58920">https://github.com/go=
lang/go/issues/58920</a>) oe-core/master currently has 1.20.1.</div><div><b=
r></div><div>Regards,</div></div>

--00000000000004f31105faf49466--

