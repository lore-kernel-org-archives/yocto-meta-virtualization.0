Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2346.1605067376370788431
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 20:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=2ljZmM0v;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 198.145.29.25, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D558238C04B4
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 04:02:54 +0000 (UTC)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 9c897f1d
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2020 05:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=to
	:from:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; s=obsd; bh=efGmHE69dF0ESRHax9GKp8VNl
	90J85q7NYoLzyMUUaw=; b=2ljZmM0vIY+Q/LlFrs/t14LjPA3meBu/Qc/n/BALw
	DtsLWq7xk6gkbqvZBye0XHHxe6AQObcaA50kKyyIr8iwbHPEfotuhKEC9mH4xXP5
	9uNIY2a3CkYICKqr6TlKEfW+1BW+EhPXXRO0THJ0/7Z8o6wxceHC3mC6FiCl/eIa
	RX3Hce1LKJi4vkgxVJ215V1bve8hQYipZLH5plD/fYDGkFSeOm5+k5tm+rZ5cn/f
	3ofZdn8rHnODyOSk3XU/OhIPnvIN2cHh39heh+BaiErOXvGK+wI/Z8vKn5+Kmy/q
	AabE1ZmQFU+CckJ0JiwBrGQEnpU2w2jSe1D/A92rRjB5w==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=to:from
	:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; q=dns; s=obsd; b=hzyZMycgUN9yQicsDEe
	n6sifKLigoZXpAvhW7xtV7flzWvF2OcQl1092mTaWf8Fv4jxrpTExpfV9o9hGAuJ
	ZmM5bZXRbR1SMljv2oba8jXld8ky+ebu8wmakzW5N1AaweeDMOKqlHfI1jY5g428
	QlwIJUstFD13jMwJAgeZAatuT4k7Kiac8BpbUKX/qfAGbwn5AEp8JyiatpLRpR/o
	69tx1+iEhJZ9JEd7gRsGevo5soK32M23uFqak2h84krN9tSBz1Xd+QzVg5PiE/Wp
	4BZzGKXb8jktDDTvlh8f3q1KCYfNYrPkp+fQswbZfxA9DzT/BFpjarFXGzk/UzpK
	WQQ==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id ddbd2bc6 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2020 05:02:50 +0100 (CET)
To: meta-virtualization@yoctoproject.org
From: "Dingo" <dingo@optimcloud.com>
Subject: xvisor was skipped: incompatible with host x86_64-linux (not in COMPATIBLE_HOST)
Message-ID: <802479e8-37ab-5cfd-4b47-b81dae132197@optimcloud.com>
Date: Wed, 11 Nov 2020 11:01:32 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

any reason Xvisor is not compatible with x86_64 ?

xvisor was skipped: incompatible with host x86_64-overc-linux (not in 
COMPATIBLE_HOST)

