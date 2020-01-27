Received: from muon.bsdio.com (muon.bsdio.com [65.103.231.193])
 by mx.groups.io with SMTP id smtpd.web10.15042.1580157390964212246
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 12:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bsdio.com, ip: 65.103.231.193, mailfrom: rebecca@bsdio.com)
Received: from muon.bsdio.com (localhost [127.0.0.1])
	by muon.bsdio.com (Postfix) with ESMTP id 106F82629A;
	Mon, 27 Jan 2020 13:39:09 -0700 (MST)
Received: from muon.bsdio.com ([127.0.0.1])
	by muon.bsdio.com (muon.bsdio.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UagD71NojMvI; Mon, 27 Jan 2020 13:39:08 -0700 (MST)
Received: from [10.0.10.120] (unknown [10.0.10.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by muon.bsdio.com (Postfix) with ESMTPSA;
	Mon, 27 Jan 2020 13:39:08 -0700 (MST)
Subject: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20200120235453.11518-1-rebecca@bsdio.com>
 <10748.1579564602739277181@lists.yoctoproject.org>
 <15EDD2ED2558BBB4.24731@lists.yoctoproject.org>
 <CADkTA4MSjsL6bp66-u8mh4YEaZwF62_ArLqcLsOSQcYrBAW6kg@mail.gmail.com>
From: "Rebecca Cran" <rebecca@bsdio.com>
Message-ID: <8b0dd59e-b092-53e0-f1e8-28a33c060843@bsdio.com>
Date: Mon, 27 Jan 2020 13:36:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MSjsL6bp66-u8mh4YEaZwF62_ArLqcLsOSQcYrBAW6kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/27/20 11:52 AM, Bruce Ashfield wrote:

> I'm seeing two version bumps, one due to a gcc9 (uwsgi) issue and the
> other a python 3.8 issue (wsgi).
>
> Are both for zeus ? If so, my comment applies equally to both.

No, uwsgi was for zeus but mod-wsgi is for master. Let's ignore the 
uwsgi patch, since I've both switched to master and from nginx to 
apache, so I'm no longer interested in it. But I'd still be interested 
in getting the mod-wsgi change committed.


-- 

Rebecca Cran

