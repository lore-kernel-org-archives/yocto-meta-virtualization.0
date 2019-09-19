Return-Path: <joakim.roubert@axis.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C641E00C8F; Thu, 19 Sep 2019 01:31:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [195.60.68.11 listed in list.dnswl.org]
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 562EDE00B9E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Sep 2019 01:31:06 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C9FCE182AA;
	Thu, 19 Sep 2019 10:31:05 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id oqRxw6ijCvmU; Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D9EAB184D9;
	Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B63A41A0AD;
	Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB1D41A0AC;
	Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 9E55E1746;
	Thu, 19 Sep 2019 10:31:03 +0200 (CEST)
Received: from [10.88.130.51] (10.0.5.60) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 19 Sep 2019 10:31:03 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190917134727.3174-1-joakimr@axis.com>
	<20190918175422.GB22136@gmail.com>
From: Joakim Roubert <joakim.roubert@axis.com>
Message-ID: <0fb556db-017c-5cf1-f7ab-b6ca4fd19d52@axis.com>
Date: Thu, 19 Sep 2019 10:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918175422.GB22136@gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
X-TM-AS-GCONF: 00
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] templates/lxc-download.in: Use curl instead of wget
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2019 08:31:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: sv-FI
Content-Transfer-Encoding: 8bit

On 2019-09-18 19:54, Bruce Ashfield wrote:
> 
> merged

Would it be possible to get this one backported/cherry-picked to the
warrior branch?

BR & TIA,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com


