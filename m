Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.5075.1634270633630715799
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Oct 2021 21:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ZGDPe1RC;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DF5D8837F2;
	Fri, 15 Oct 2021 06:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634270631;
	bh=WvUMkuR214YDucsEdNf2CYalJPkBsqfLxNzYSGSQx0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=ZGDPe1RCGLiKFkPumaoplURh8Akyi7tfGtq7BszttabdJ2OmQJVtGDzWP4tdxHwZx
	 XJO+Fgj8gq2eoqFjzeT1i76+qcElyOQV2TNmWf5QQT+bwQ+KEsgiYg5xaaCU4Plhxj
	 PIfVtDhYD5ekW9h1N5wLE75J8njB5GHv+Vn28RZfJSu04wR9WJzerNa9UpOPuPs1Rt
	 /USwg0LQO8xO2OBp+DvJJs+X0W4suvbkv6Wl68gFVB5mQHxhvKDF5+CFbnToE24Gfh
	 XId8AYQdC04yfF3PDOQ3OS6hAHxf4iEaIL8KkzUGKmHfwwJnVOiRajEw2GxNRSl5AL
	 IFv7zcwwBYDYA==
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 01:03:50 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: nsenter installation in dunfell
Message-ID: <2b23e5394f9c6af64c7f33b9ae12c39e@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

Could you please cherry-pick the following commit into dunfell?

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-core?id=94501882dcf6eec411d68696e59953653c787eab

It fixes the following run-time error when launching podman:

Error: error configuring CNI network plugin: exec: "nsenter": executable 
file not found in $PATH

Thanks,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de
