Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web10.40597.1599483679382266153
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 06:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=TBXVFRYy;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 570d30a6
	for <meta-virtualization@lists.yoctoproject.org>;
	Mon, 7 Sep 2020 15:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=to
	:from:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; s=obsd; bh=Ivq3jqyPELSfHs+vmP0hQlU05
	I2DXLRdOVskDNcymXo=; b=TBXVFRYyW/rgyNaaUe4QtVRTLvKMTLsrBf0QCiuT8
	7rOrZ8PVFFdOBW1k1dQaYywVc4rzMxS+VulSULd4ScALwdFdFzaj5d2CIvCymXie
	zfT6L36JOD0fsHZt9YoDf+DQZBsxtow65C3OoB2x36Sr8QimBzkQyIztYAcWwa2X
	Jws+Z+urHmVxDzjPybfkN0NMYbb8qEkErRfuqyQT3ecZcQF6Mue96ckubllXg5JS
	TjGVdfr7DoHieBqDiySlBppB+IFLn7y0aNO+bPPoMM+WVZRrFUpjCAP4dXlNludD
	QTWwFKFxvarftl194W7Mxnt0U/AZI/taNiedVDbThliZQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=to:from
	:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; q=dns; s=obsd; b=LagfN0NuuKiLnyYmdaF
	NAuIPCiXJX0Op0Z52fXe+316dwpBC7MrnA10QuS7gB4S82CM1wXlWsATLnR2Xsjj
	DsJcpdaPDJwxs9deJNybLHUKXazoXC3FP61BO2Y3uhZ2YhAwA6rM3gf4TdUylc+n
	I/G71c8JDpjgKNqo8xjxe/L20e/dGb8pjV+YFm6oQdgdCKpBQwyd84hAJj+0JDVw
	f4iZHJPmbU/StqQ4rdJ8Tw3+MTWmIIhjAydlRUBdS4hH1nSLpFZ8clSRMSr7HfIK
	Y4vNYV7K5a/GNp7663QrhVH1WnspJOr8+FZUZdg/R2Ov00ymf1IoBiBad7W3jXdn
	lrg==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 29ddf63a (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Mon, 7 Sep 2020 15:01:15 +0200 (CEST)
To: meta-virtualization@lists.yoctoproject.org
From: "Yocto" <yocto@optimcloud.com>
Subject: podman & docker conflict
Message-ID: <23410e55-5b13-fd4c-7c0f-5f013af8132f@optimcloud.com>
Date: Mon, 7 Sep 2020 20:00:05 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

seems that trying to build podman and docker in the same image creates 
an install conflict.

anyway to get around this, and i know there are those of you asking why 
both?

simply put podman allows for some tooling the create docker containers, 
and docker at the moment is the default container platform, i aim to 
change this but, i also need to prove podman and functionalities under 
the yocto image on the platform we have.

