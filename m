Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465B6FCB63B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 17:13:02 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74419.1772817176700153641
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 09:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ex95cXvm;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1488701085a.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2026 09:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772817175; x=1773421975; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YN7wQNwdGZXj1Q9UXcO0BG7q/GHs1dEo9aTKcS2eFCk=;
        b=ex95cXvm1OXkME2q6FfjMzH11zoqiV9vtFe/CoZQXqo43MPj8EwjG0n6EpXJYCKcwZ
         PHVAAKWprP8xedR3NM2byu7Z+dgBcEe4UkrqIt7PyN/wkZAuiKV2g1Q5p/oY9bBeyTqs
         vBZw7ANgHr1LaN1eSOdP9OV3Kfo8xRp/ljnp8Mb19v+Uk2pT0NdQgccVqGLeWaRKE+cz
         tzFFgYeO7S38pkTLMB/HXJbKXMAw9Jx4LEr7rAoXgNDq6BRgUeHO0/t7rUq0wDoAYRKm
         H0nIUJYInPE1ZwAoTOXVKjoMZcyDnNFRo5BLd18dTTM7mZ30kdKmznRbwy1OPBkRsE20
         I6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817175; x=1773421975;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YN7wQNwdGZXj1Q9UXcO0BG7q/GHs1dEo9aTKcS2eFCk=;
        b=SxmOepBfKbeSCRePZ+kLr2RSDf8eZSAkCBuXUrT5OLVdDeJ4n25AMqLIr5zIVnncH9
         GDB0XUFBYsvDb4A+Pm0fsrWsH54H55aWunv4h3kBIsAKmrCi4jMgs2kGisnLXHJv3gGN
         8wVxLd3rDizQAtAeNnWd4ytga+hR6mHMo2bNs/4p4cGdczoA2D3Bp7q2gFCecovavF06
         kdDf4CuDTxcBfGBeQHhPgnnKUMMwz3jQGELZ0rUDzGTygK35f96jBXxeOSsMeLAkdHpy
         ocJ0BfTc/95PcESN8YvgpplLo/niv/T5LNki2JVRVuYysboSqwqzGRE70GXLdmqtklch
         PuLg==
X-Gm-Message-State: AOJu0Yy9QR2ZUxfnhxP+OFzej3k2PKtEGXfx2Poq1g5KKJVUB16MyCnS
	whDcLYLPBoX11yGYd3iLAY8Y3rTNQLyo4YOfg4wbp6pFFGsErWmyWwcPFVpnIJauTCE=
X-Gm-Gg: ATEYQzzD7N88ZSmm4bD4C5YLV+7jCHpR4zYOIphqDKLlC74lJWtCNL19gLXkwwTMtE1
	/AIk4GgwHKiWF5w2XPQmUttbHJbqg5VAHp4ia+8wYC6fpE8UanMJuNynPCifwc+m/gRDfgtIrFQ
	Xis13hMqjIGxjQSfKZQnMP3544Vo7JiEGsoe2GtqaIMCpSzuoMPdTjJ8IxqWiZsQZy4qg9BtDGR
	HWOLkJhNtuNTmN4oQL/gCcLM5IK7VfhPSpIZzfgnPSISGgJfuTuT58/GdS9Xj6qUALfyAoa0sBp
	gJgbx9poYd6CbqzK22bM2X8d5Er/MG8eKLhlzlHa+luwAe+3vroVv9+SifLoWKMwFVApMunlscL
	NIzfChm+pg56s8ZYW/nseZgvNrdIytYxZX0zElpnIEQt2BwU+4jBgLNykEbiLh1bVQZiM5rX76I
	j2aFg4kJS/VNAgZJRZ8rzVoeD6B4nNPkzh3cJS5Ednjo8Myl88qoNNoo639l11d4yPd1tbDe3rh
	y3C00LMPsAXbap2latpiVjaqIDcQzqejif4
X-Received: by 2002:a05:620a:4149:b0:8cb:72b2:2a13 with SMTP id af79cd13be357-8cd6d3fb75dmr365511785a.13.1772817175051;
        Fri, 06 Mar 2026 09:12:55 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f54b755sm177145985a.33.2026.03.06.09.12.54
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:12:54 -0800 (PST)
Date: Fri, 6 Mar 2026 12:12:52 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Heads up: update cycle is starting
Message-ID: <aasLFOLQJZCaxvsn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2026 17:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9624

Hi all,

Just a heads up that most of the new LTS features are now in the tree,
and OEcore is at the M2 milestone.

That means I'll start flowing package updates into master-next and
then into master over the next two weeks.

There's new test infrastructure for meta-vir, so most updates will
include sanity tests / updated tests to more easily test the stack.

If you don't see your favourite recipe updated by mid-march, feel
free to ping and see if there's a problem.

Cheers,

Bruce

