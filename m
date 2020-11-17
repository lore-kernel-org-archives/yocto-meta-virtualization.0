Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7751.1605619919406155440
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=cmDdtqZM;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A7E4938C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=618; q=dns/txt; s=axis-central1;
  t=1605619916; x=1637155916;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=U5BjrA9KsbkgWfmPatdLw4jIP7XwJlyEiF+GcGbpzuk=;
  b=cmDdtqZM7XI8EKXRWMr/SDbui5AJk2ba17F8QR/9E19o9AJXTEQSia46
   2r/LIuuHsXFn6zt958v+z4uiLhgDt/VoijSJRaHhezM+G3flV1ArCje1i
   +1JjsnXlu8hcK1F+nhgLUrgCph88nXEYrp65VnXjEjMR9pOm+NRUyDadO
   s+i4Zuxz9iQKyzlLCNAxN6SzkHrkAGlltRl1cYxdF8pB6dKV0fUDjU7h+
   j6WoykI+Z6YK2PSlLHB9h7EdnpvdTfRsu7sj6CBlA75KcoiednX29tLVJ
   c6StKVSrI/n+qkNNVY34WksaocksKOsBWm+ldTjVTdbMq6a46eyDLB6Rg
   Q==;
IronPort-SDR: t7zZydWrKDiOXg+hoeiAk+YuqlSeosR/ruxQwouXCQiaO/7PLqaY/LdbssCwr6WA9Q0syWM39m
 ZmsNsVWMuIzLnw9xj6ncEV2BBH9SirL23jngbtZRIHOXJ+a+DU0l48HRLPW6M/R3D4asf5Dtdr
 HxB4WODq/VyE4mRvljUp3I7MO8RTjhAi3/50XfG8aB0nEbwmi7im5tp4FYlQv53jGCvd6Ym61/
 fZhCWPeGheyWGv7xskAZiU+5Vh2r6I5Ngd26OlOuzjODSX8q3/rYen4tRguMJMk230J/uCgb0K
 a50=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="14597211"
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
 <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
Date: Tue, 17 Nov 2020 14:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-11-17 14:27, Bruce Ashfield wrote:
>=20
> I already have this queued in my WIP branch.

Ah, good.

> But without being able to assemble a single node working "cluster", thi=
s=20
> is still stuck in my staging branch.

I am not sure what this single node cluster is. Is it a k3s master=20
running on a single machine, where you can deploy things? What are the=20
current issues that you face there?

BR,

/Joakim
--=20
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

