Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B449FE00CD4; Wed, 15 Nov 2017 12:58:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2D74E00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 12:58:42 -0800 (PST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vAFKwaax020048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 15 Nov 2017 20:58:37 GMT
Message-ID: <1510779516.3952.165.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	meta-virtualization@yoctoproject.org, bruce.ashfield@windriver.com
Date: Wed, 15 Nov 2017 20:58:36 +0000
In-Reply-To: <1510768793-27481-1-git-send-email-mark.asselstine@windriver.com>
References: <1510768793-27481-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [m-c-s][PATCH] python-*: fixup postinst scripts
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
X-List-Received-Date: Wed, 15 Nov 2017 20:58:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-11-15 at 12:59 -0500, Mark Asselstine wrote:
> Checking for "$D" and doing an "exit 1" now results in errors such
> as:
> 
> [log_check] warning: %post(keystone-cronjobs-...) scriptlet failed,
> exit status 2
> 
> during image creation. Instead of escaping the script for "level-1"
> (image creation postinst) we wrap the "level-2" (first boot) postinst
> in an if statement. This also ensure the scriptlet in
> indentity.bbclass is less prone to behaving differently based on the
> postinsts defined in the classes which inherit 'identity'.

I think this could mean the postinst doesn't get executed at all if
there isn't an exit 1, else how would it know to defer to first boot?

Cheers,

Richard

