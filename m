Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19166C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 00:19:55 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.1220.1669767591516315640
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 16:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LsIKUDHj;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id l127so17137993oia.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 16:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQxVenu3DZAe3GUVkRcvQNdvdjTPlfobNmKRWQjeqag=;
        b=LsIKUDHj4IAprnnTZCJrH9x4rpj4thA3osjeND+ZtRu+PTeL+q5TEangbiS78sIozB
         j8KcomOKSYUTTOH0AJ8zqkapdmdkU5x14e+xPj2+pIX/jviHmtQzp/gWNQ3N5aVLpYTU
         pH5frNAsyeRSd6T8J5z99SiNmSTnc6C4CS3OEKm9DhZ/RfBTGaut0UsHTNNOFInKNfzO
         GxPzJQPWH0sncY3sivy+0f22Yrdk3SlmDQWUvVO+cTtCdKgJvmnEWjEEOmzT8+Ry43nd
         mvcrgHoRC0Q/vnB7E+FEzzVIqqyhbBylfLA8yH2LuJ+KqvsVXQhevkf0FDO8OZZZIHJy
         RaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQxVenu3DZAe3GUVkRcvQNdvdjTPlfobNmKRWQjeqag=;
        b=Fyxw1F+wlcs/tKBARBoFYclnccZstU+yiux2VQEEtEbf7ed/bBTifN4rhhIUVLFsk+
         E/43QSwGMwhfW2fu05dCc8e2OClvQOlxZ1dOAuRF6LJa66ceuoT5t06RlezQd3VQ2rpO
         HAxNJt5r28J1kLhrQSuiEmLmVJmH2KTJOzEZmR/rgLIdDtqED7auO1OKdwDCtCwlVMaI
         hOwu+EbruAyYKUY3eFmRbUA0Es000MrdrCniUDNgvGVcnn+LanwD10081BQCjhkt9IBJ
         zvHt2MG7EidbTop56itOZsEYBKQ9xKkKZWkgMAJLLaVzlkk+aNdCzirH2vRVymP8+ytI
         nHEA==
X-Gm-Message-State: ANoB5pkkkTjeNSzUev8nqlq03frLVZDHvWfj+M5jMnY3CJneS/K50J+o
	rjTKAFy2L1zg+1tQZZndXHmZqlbj3B6ukTzsBD00W8hI
X-Google-Smtp-Source: AA0mqf64oBqt4N8fmUJJK1uwnKVrtdlQ6AnZZ/blGev1x9+innLW7vdn4rUgtbTjGJs+Ortgw12I5Pc46TbfI/Kp7mQ=
X-Received: by 2002:aca:120d:0:b0:359:f8a7:c88 with SMTP id
 13-20020aca120d000000b00359f8a70c88mr27252475ois.278.1669767590511; Tue, 29
 Nov 2022 16:19:50 -0800 (PST)
MIME-Version: 1.0
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 11:19:39 +1100
Message-ID: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
Subject: Backport Repo branch changes (master=>main) to Kirkstone branch
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000017093f05eea51002"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 00:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7705

--00000000000017093f05eea51002
Content-Type: text/plain; charset="UTF-8"

Hi,

Is it possible to backport these patches from master to kirkstone?

I could do it but I am not confident about submitting patches via email.

Regards,

Tony Davies

--00000000000017093f05eea51002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Is it possible to backport these pa=
tches from master to kirkstone?</div><div><br></div><div>I could do it but =
I am not confident about submitting patches via email.</div><div><br></div>=
<div>Regards,</div><div><br></div><div>Tony Davies</div></div>

--00000000000017093f05eea51002--

