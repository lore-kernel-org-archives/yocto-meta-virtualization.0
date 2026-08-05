Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791A5C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 22:02:01 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6943.1785967311330145740
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 15:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kMs/M74Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f032b47e3cso9925516d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785967310; x=1786572110; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=kMs/M74Y2RWWDFZox30BLy/o7HmSbuXonEeFygJQv8Z6H/qbqkfAbpIRtrbdmc572a
         1f6/OVm0KaQK9wqpXPoZexTXG+0YIwR2vrNz8xIt3SeNdjWZVi40ZijonGXmaTRQFSqv
         724Og0rK6TqjuDpUcNL7/koF565c4OQkMr6J2jB+tymujOGpyo23XwIsiPHkwRycGJKb
         M0xqgPNsuP65eEr8yJoDZWbs07ml8Xt98eXkyQBDiz6x2wbxoRdn32rb4xBXifBRVcvZ
         ioOB5XVQ9keNa9GmvGBibcJGd4aXDflkDEP7CvEDICbIpSnohs0AY93rY3WZCDG56MzF
         v1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785967310; x=1786572110;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=aSZ1oTEtyCorDIO+xCBC9EqBdMUaTIQxHGQTY/tq7KHYHEy0AK+ca+XuSm5eJ11zAv
         zzLRRgYFKylT20td1Ol1hsA3gy5alxlzpYTMkRnSnotVRGmScWtWUcpsA/udDJBqYYCI
         qBlSOo5soHoTuVRs8mz3UVP2OI7XTJ4JPaTNLUvCJKeQ6mGahjQWMnpicrcylda7N0sc
         ECbORSWEPr7NcqRVEVZ9TsqDqqqy1WRSOjNa8ZXW8EZfehoQR68120+AxWdgM+TkvbBq
         wE0Dze24+XXde6gI6j2JfixtN9UU7fXzvpVswrQKeq/+txaDwANhxRcYrX9/qMcRmHKX
         MHJg==
X-Gm-Message-State: AOJu0Yy2oYlXC5sPGQGvGv14bRosTb8OggfJOGXQnFoU8XJOqxwadQb5
	AiBoau4ADW05DkPZF7y2Lsf/D24FpIinVQW4vZgJqVlcCTZgk17sNaKG5jNt/vPv
X-Gm-Gg: AR+sD137v+Gxs8osFvr5HyohxPU1B1esK8ePpnbmGElSQp1u8q2TsZdQR/lplt+LBvK
	JnBXmS8YRCmSRpok6I4k7FjCazri9jV6FzvfvXqEtoJLM7CxgDoDwXfuN0VM/vN/n2h8J25nk3b
	83k7eZOWsMjHkZOPoGPhgyUgXmyBl+vxQaLZapaH7bWxYjDBt+HX0ShuHm44nw/FNlCai5RvePl
	92JrKsfaTJIg6uiQDP1ZJaMnhsA86qSAZ7ZWiLdYf+066LQq6atON2hlUimRB155vbWS63wTLVg
	Pxo7+nGVd2uEBWVXcub6Wl03KN4fDibEToy2JMafR2NRlKUBcPw+NscPcjHSEP42Qaxu8qVEHZv
	UqmpxxYqEeca/ap/4eOhFlQg34S8KmhbXsT4SqvjiRPK4cwKZXVC9KfU8xpDqeshULGRSmrYn6c
	S6omQpm+gv3SsF6xFhXu87aJd4Td2I/HggvxOktGLePC+Uork0Ry2OXA8HvSIBLeU4fV8b4k6ps
	JCp/wYS5sYXFwy48zg9rcoca5n3CXoaPj60CPU1OVjhktr12p9ALDupNZchGultjNCzxkD90qJR
	8xox9qNAckj378g9rZHTHvFJtakegIhecZSc88Ulkwpx4tCe0W3kRxnWI6ifJg==
X-Received: by 2002:ad4:4eeb:0:b0:908:7fce:f111 with SMTP id 6a1803df08f44-90881098aecmr119871896d6.6.1785967309927;
        Wed, 05 Aug 2026 15:01:49 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9088eb7e978sm9282346d6.42.2026.08.05.15.01.49
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:01:49 -0700 (PDT)
Message-ID: <6a73b2cd.8e833c70.ca1cb.a8b7@mx.google.com>
Date: Wed, 05 Aug 2026 15:01:49 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2 1/5] vcontainer-bbmask.inc: add
 python3-pexpect,-ptyprocess
In-Reply-To: <20260730134009.1547930-1-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260730134009.1547930-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 22:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10025

merged

Bruce

