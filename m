Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 238DFE008E5; Thu, 27 Nov 2014 07:34:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,WEIRD_PORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.50 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CFEDE00874
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 07:34:55 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id pn19so3651294lab.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LetPNxH59xcI5WQpi5t+RXAKIX6JWxoaK0dn940F1eA=;
	b=eRV3UDLH+of15Rw/00XizjnvkbT4MDQtn77vvaLr/mQ75QEFH/atvKc+LfRBtbO160
	px5zgXX09gYsXc0yz9hcmss66fFb30QSMUxVf6G2fadiv7po/WpEwJjPVmPmOzS/9JaA
	oSMGZkD25WtBsrXKykR656wEC7rtmBIp/jesGYuIvxCsUqyDV+qgEECuNhaFBvWDit3x
	fl+NXDvVcsgA4ImZ35HYczZtwzn6oO6qpmBUdam0nPmBC5ozILvsU/cfp/SZb57LlCU0
	OyyFLP+yA3erpSpWOnq/vucZ7vwYCSVyoYKjsbDvpjyfLUDWbJDVHQ9eKLjSpv/V5WjF
	XV2Q==
MIME-Version: 1.0
X-Received: by 10.152.203.199 with SMTP id ks7mr39643929lac.31.1417102494216; 
	Thu, 27 Nov 2014 07:34:54 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 27 Nov 2014 07:34:54 -0800 (PST)
In-Reply-To: <CAH4+OFoSB_kBOaSFV50WB5QtpZte16-ZRY=LDu=wUV=CJhRhug@mail.gmail.com>
References: <CAH4+OFoSB_kBOaSFV50WB5QtpZte16-ZRY=LDu=wUV=CJhRhug@mail.gmail.com>
Date: Thu, 27 Nov 2014 10:34:54 -0500
Message-ID: <CADkTA4NyCLps3=7OD9rn3UFseOjbAqcQKw+Nc=utLv1zEeW+fA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Srinivasa Rao Ragolu <sragolu@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Keystone is not working in meta-cloud-services Stable/juno
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
X-List-Received-Date: Thu, 27 Nov 2014 15:34:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 27, 2014 at 1:03 AM, Srinivasa Rao Ragolu
<sragolu@mvista.com> wrote:
> Hi All,
>
> I am new to this forum. Please help me in solving this issue with
> stable/juno keystone. I have taken meta-cloud-services of stable/juno
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=382e7184e5a23ebfeb2fd9ec432e6545170fee7d
>

It's hard to say .. but I can say that everything works fine here. I
never push an
untested change:

root@controller:~# uname -a
Linux controller 3.14.19-yocto-standard #1 SMP PREEMPT Tue Oct 14
16:50:12 EDT 2014 x86_64 GNU/Linux
root@controller:~# keystone user-list
WARNING: Bypassing authentication using a token & endpoint
(authentication credentials are being ignored).
+----------------------------------+------------+---------+-----------------------+
|                id                |    name    | enabled |
email         |
+----------------------------------+------------+---------+-----------------------+
| e48cedc717d34becb8a92d93b5415a23 |   admin    |   True  |
admin@domain.com   |
| 7b30fcde558a488c95c6d11b92d8fd07 |  alt_demo  |   True  |
alt_demo@domain.com  |
| 3c06691847264c8bafcf7887bb536136 |  barbican  |   True  |
barbican@domain.com  |
| 260cbb94ea144801b9078de84dd9f629 | ceilometer |   True  |
ceilometer@domain.com |
| c4c25a5b3867438eb34bfe3ac660bcbb |   cinder   |   True  |
cinder@domain.com   |
| c6ab4e229fcd43e8b7f2ec19c8f6d3f0 |    demo    |   True  |
demo@domain.com    |
| e3e8c2b5532b4b828a00fef1e25809b7 |   glance   |   True  |
glance@domain.com   |
| 2a9ee8d459354f71b30a1504f79cd1b8 |    heat    |   True  |
heat@domain.com    |
| 7e348b3f0077493381aaa372dd7d13bd |  neutron   |   True  |
neutron@domain.com  |
| 4f93bd7ebd38460c93768801ff257f83 |    nova    |   True  |
nova@domain.com    |
| b3fc4205fe7b4e9bbcaa39b078bc1e8b |   swift    |   True  |
swift@domain.com   |
| e924b0717bf947538be9f678a6f7e252 |   trove    |   True  |
trove@domain.com   |
+----------------------------------+------------+---------+-----------------------+

Have you checked the apache logs ? Is keystone-all running ? Is this the first
boot, or a secondary boot ?

Bruce

> After booting openstack-image-controller, ran
> /etc/keystone/service-user-setup
>
> after that any keystone or openstack service commands giving below errors.
>
> root@controller:/etc/keystone# keystone user-list
> WARNING: Bypassing authentication using a token & endpoint (authentication
> credentials are being ignored).
> Unable to establish connection to
> http://controller:8081/keystone/admin/v2.0/users
>
> root@controller:/etc/keystone# keystone --debug user-list
> WARNING: Bypassing authentication using a token & endpoint (authentication
> credentials are being ignored).
> DEBUG:keystoneclient.session:REQ: curl -i -X GET
> http://controller:8081/keystone/admin/v2.0/users -H "User-Agent:
> python-keystoneclient" -H "X-Auth-Token:
> {SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
> INFO:requests.packages.urllib3.connectionpool:Starting new HTTP connection
> (1): controller
> Unable to establish connection to
> http://controller:8081/keystone/admin/v2.0/users
>
>
> my environment variables are
> root@controller:/etc/keystone# env
> TERM=xterm
> SHELL=/bin/sh
> SSH_CLIENT=192.168.7.220 54638 22
> SSH_TTY=/dev/pts/0
> USER=root
> MAIL=/var/mail/root
> PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> PWD=/etc/keystone
> OS_PASSWORD=password
> EDITOR=/bin/vi
> TZ=UTC
> PS1=\u@\h:\w\$
> OS_AUTH_URL=http://controller:8081/keystone/main/v2.0/
> OS_USERNAME=admin
> SHLVL=1
> HOME=/home/root
> OS_TENANT_NAME=admin
> LOGNAME=root
> SSH_CONNECTION=192.168.7.220 54638 192.168.7.2 22
> SERVICE_ENDPOINT=http://controller:8081/keystone/admin/v2.0
> SERVICE_TOKEN=password
> _=/usr/bin/env
> OLDPWD=/home/root
>
>
> keystone.conf is
> # The port number which the public service listens on
> # public_port = 5000
>
> # The port number which the public admin listens on
> # admin_port = 35357
> admin_endpoint = http://192.168.7.2:8081/keystone/admin/
> public_endpoint = http://192.168.7.2:8081/keystone/main/
>
>
> I will be really thankful, if you could guide me.
>
> Thanks,
> Srinivas.
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

