Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FABFCD98CF
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 19:34:45 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96649.1781379284427941866
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Jun 2026 12:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dK0hbFsQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bed19623d6eso293021666b.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781379282; x=1781984082; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4/GAxoTD5qZV8f2Szi8ziqJD/d4R7z+1zt5QzRqqus=;
        b=dK0hbFsQx/xMyh7MwF/dIKFWqIAaEX5Dzyv+5r1U4ITuUsS9oOihO74j9fnEbOVHop
         ysFAU0cEHaIZSGsKXuvifdUn33kADhYOzfVvCcy1JFqJDwbdC9f73xUyxPnY18qUlmEc
         20qUROrvGhivRxCB6NkTTBmZdwkZXLBbDGPCPvqxJNs+8JYHS069J8IA3ez60Q9VVe0z
         LnhCFwfTR9Y3xdShQPuWTvD69XVJKTYY76zLDYfp4LimMmk8vW2kWz94MUZ1iUrwQjbs
         xJAcagv1MBI3aBavEHkXO+R0vrcu18zLrGC8+C0DvloTcSWI+nYX25fAd2OXn0Vmrdc5
         mzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781379282; x=1781984082;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4/GAxoTD5qZV8f2Szi8ziqJD/d4R7z+1zt5QzRqqus=;
        b=tT1otgJ7YaNEXlKKck1c5xBsx6D2iXA83N88gF5ZXJAJKJZYwYvirFSlh83o+etQiX
         PKEFjKwD/W0aqClwNKfFq6ztdd78EVcFfTVw9Furg9Y6cYItLPPwvhFusG5PQbPeX8lc
         myxYjgNnqxkBjLmxzm0QUE8qscdc1EyooD8PlcltrYZ43ezwpnw4UAhL2Os6a/kYU2hT
         JRiYkogc6Mde+fJUAmT5hKSWQnulNxmTDCvZbOp12MjNI0FrYkywYNIAQmJ5/vpT9qs2
         9ML5UMH3sRZNhlp+zuSBF/3yrufquMIx8pxlBM3VVffRrjfM0acpQqJQQEy574lbnPwp
         JJ+g==
X-Gm-Message-State: AOJu0YxGOc54E4cUGO0KFWVauzn04zyNgZXd8hACsNDL5yZBxXfiKxAl
	ThXRwOiPzg6/Cm/vJBwNKsP/6A3WVz7/KDKHIBnJPg1ayDh40BEJUGKCFVGqWg==
X-Gm-Gg: Acq92OFv5gmEob3bOZUVFs2hs01KGi5sNMuKYhSIvtUEdKxBHHSSJqyq7Iez62m7QBd
	1zYOCtBPozaDTrjMAVEXDjseeBbEnk0gxXCX+TmH10fGrhvgqM+QinoAaW7DTVqDd9ze6SMKqqJ
	6foTf22hcJ4aUv4WlKZhWh23cVN2BXcHj2EN1W93Xw0X+T9RKU3YHpMBrXzd6S+DX5sVqur6S78
	rVsbQgwnOYCjFHqVBQbLRDdfxU+WjnxcSNAYpIJSJKxRcz9ygHUFFS6s4tYI2NjrPHHlxt+5J/i
	04dH6anjrHiqYi82lWiPu9H9Kq1iR/oQ2m/G7y41owN+n/lMAXFj6Uv3nb1UuDdEOWnNs7B2Ds+
	NTHcGOl6jisfZ2tDK0Kr4Nbl/otg5CqDlP8v1pw17v7xTZ+I9JWSESoATenkXj2VKd5FXeRMrD5
	Xe+67ApPPVAlfaMyQhOCs5r4Hmo0Hv/F5R7llCIPjS91lScbTytH1ZmyWEY62w6G2u1UdrJtGv/
	i8+oRmRGPD54FbSsnqTp2MfyU3R0A/oVkbynpP5z93SOORhG1TEVZ7Q3JA=
X-Received: by 2002:a17:907:d508:b0:be2:208a:a8ae with SMTP id a640c23a62f3a-bfe28d1ab09mr347405966b.22.1781379282366;
        Sat, 13 Jun 2026 12:34:42 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:bcd7:d841:1b58:a9f2? (2a02-a466-68ed-1-bcd7-d841-1b58-a9f2.fixed6.kpn.net. [2a02:a466:68ed:1:bcd7:d841:1b58:a9f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm242221166b.28.2026.06.13.12.34.41
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 12:34:41 -0700 (PDT)
Message-ID: <e5d18f05-f00f-45df-a4c1-c2d21ca17de7@gmail.com>
Date: Sat, 13 Jun 2026 21:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ferry Toth <fntoth@gmail.com>
Subject: lxc: starting a container errors out
To: meta-virtualization@lists.yoctoproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 19:34:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9890

root@yuna:~# lxc-create --name mycontainer --template download -- --dist 
ubuntu --release resolute --arch amd64

mktemp: failed to create file via template '-d/tmp.XXXXXXXXXX': No such 
file or directory


This can be traced back to

- DOWNLOAD_TEMP="${DOWNLOAD_TEMP}$(mktemp -d)"

+ DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"


in patch "templates-actually-create-DOWNLOAD_TEMP-directory.patch."

At this point in the code it is guaranteed that DOWNLOAD_TEMP is unset. 
And `mktemp -p -d` results to the above error (on linux).

The patch needs to be dropped.

Ferry



