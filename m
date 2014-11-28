Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AE01E008EA; Thu, 27 Nov 2014 21:57:05 -0800 (PST)
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
	*      [209.85.217.179 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A908DE0082F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 21:57:03 -0800 (PST)
Received: by mail-lb0-f179.google.com with SMTP id z11so5035595lbi.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 21:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dpaj0rp0BWf6ciXF++5RwS1PI1me02sJTNVK2k104Xs=;
	b=Q8S5311Hw+w/rPKgGqRnoVwJB61td/uSyKqRR6Vk7Rtsn2VEJjyssgxd5pKW0Z9xkZ
	YJ6TLJXwpeBzMpweedAJAhDwY1WDaCz8yq+SGhg48ASmiO3ZwMB0qjfq3/MFvwhN0gbo
	Kj7EF2sUUXrvzFLWqfd92c8hRDoVutdh9VK1zGSVLGhzn02jRXoGLMKO+yrdsE3stsun
	GAFBoeMtKEbd8Jkw9VAsd2XfNkSQcYCSCJ5qzyEZ99SWn/i4fbO2vJljtlZbpauA2Au0
	jlDv9zJRx9YU5HgtjWOZk9q4KIv6wjL7jr/5HOOc5wd7JQ4RH+m9Oda39WY4nqyiuI2d
	g32Q==
MIME-Version: 1.0
X-Received: by 10.152.5.132 with SMTP id s4mr20810620las.39.1417154222063;
	Thu, 27 Nov 2014 21:57:02 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 27 Nov 2014 21:57:02 -0800 (PST)
In-Reply-To: <CAH4+OFr1W=CfqXoWNEsCjZrqPMLF8TGC8zP4HHBXYvtJ8-3voA@mail.gmail.com>
References: <CAH4+OFoSB_kBOaSFV50WB5QtpZte16-ZRY=LDu=wUV=CJhRhug@mail.gmail.com>
	<CADkTA4NyCLps3=7OD9rn3UFseOjbAqcQKw+Nc=utLv1zEeW+fA@mail.gmail.com>
	<CAH4+OFr1W=CfqXoWNEsCjZrqPMLF8TGC8zP4HHBXYvtJ8-3voA@mail.gmail.com>
Date: Fri, 28 Nov 2014 00:57:02 -0500
Message-ID: <CADkTA4OigYhtPqFVXbhUQuQJwD3P-QrLzFqkPN4zo4sKvgJcfQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Nov 2014 05:57:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 27, 2014 at 12:17 PM, Srinivasa Rao Ragolu
<sragolu@mvista.com> wrote:
> Hi Bruce,
>
> Thank you so much for your quick reply.
>
> Regarding issue:
>
> 1) I am using lighttpd and apache2 is not running. I am eager to know , is
> there any link between apache2 and keystone?

There is a link, at least how we configure things. The keystone
project moved away
from using uwsgi standalone server to apache, since apache is obviously a more
performant and robust solution.

This commit makes the switch here:

commit 1c34736247f8ae18d054cfecfec54152bf27f1d9

Author: Liam R. Howlett <Liam.Howlett@WindRiver.com>

Date:   Fri Sep 19 15:52:17 2014 -0400


    keystone: Change packages configuration to use apache keystone.



    This commit changes all required configurations to use keystone running

    on apache.  The following packages configurations were modified for

    keystone running on apache:  python-neutron, python-nova, tempest,

            python-swift, python-rally, python-heat, python-glance,

            python-cinder, python-ceilmoeter, python-horizon.



    Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>

So yes .. you must have apache running if you want to use keystone services.

>
> 2) I observed keystone is running on 35357 port.
>     #netstat -nlp | grep 35357
>   But in the keystone and other service configurations of
> meta-cloud-services, port listed as 8081
>
> 3) If I use meta-cloud-services stable/juno branch as it is, keystone not
> able to authenticate itself and other services. Not able to create any
> users/services/tenants/roles.
>
> 4) I am sure some silly link I might have missed, but struggled a lot , but
> no luck.
>
> Finally I have changed all services and keystone to 35357 and 5000 and all
> are working fine.
>
> Could you please provide me clue to figure out the issue with 8081 port? and
> why keystone running on 35357 default?

See above .. they key is to use apache.

Bruce

>
> Thanks,
> Srinivas.
>
> On Thu, Nov 27, 2014 at 9:04 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Thu, Nov 27, 2014 at 1:03 AM, Srinivasa Rao Ragolu
>> <sragolu@mvista.com> wrote:
>> > Hi All,
>> >
>> > I am new to this forum. Please help me in solving this issue with
>> > stable/juno keystone. I have taken meta-cloud-services of stable/juno
>> >
>> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=382e7184e5a23ebfeb2fd9ec432e6545170fee7d
>> >
>>
>> It's hard to say .. but I can say that everything works fine here. I
>> never push an
>> untested change:
>>
>> root@controller:~# uname -a
>> Linux controller 3.14.19-yocto-standard #1 SMP PREEMPT Tue Oct 14
>> 16:50:12 EDT 2014 x86_64 GNU/Linux
>> root@controller:~# keystone user-list
>> WARNING: Bypassing authentication using a token & endpoint
>> (authentication credentials are being ignored).
>>
>> +----------------------------------+------------+---------+-----------------------+
>> |                id                |    name    | enabled |
>> email         |
>>
>> +----------------------------------+------------+---------+-----------------------+
>> | e48cedc717d34becb8a92d93b5415a23 |   admin    |   True  |
>> admin@domain.com   |
>> | 7b30fcde558a488c95c6d11b92d8fd07 |  alt_demo  |   True  |
>> alt_demo@domain.com  |
>> | 3c06691847264c8bafcf7887bb536136 |  barbican  |   True  |
>> barbican@domain.com  |
>> | 260cbb94ea144801b9078de84dd9f629 | ceilometer |   True  |
>> ceilometer@domain.com |
>> | c4c25a5b3867438eb34bfe3ac660bcbb |   cinder   |   True  |
>> cinder@domain.com   |
>> | c6ab4e229fcd43e8b7f2ec19c8f6d3f0 |    demo    |   True  |
>> demo@domain.com    |
>> | e3e8c2b5532b4b828a00fef1e25809b7 |   glance   |   True  |
>> glance@domain.com   |
>> | 2a9ee8d459354f71b30a1504f79cd1b8 |    heat    |   True  |
>> heat@domain.com    |
>> | 7e348b3f0077493381aaa372dd7d13bd |  neutron   |   True  |
>> neutron@domain.com  |
>> | 4f93bd7ebd38460c93768801ff257f83 |    nova    |   True  |
>> nova@domain.com    |
>> | b3fc4205fe7b4e9bbcaa39b078bc1e8b |   swift    |   True  |
>> swift@domain.com   |
>> | e924b0717bf947538be9f678a6f7e252 |   trove    |   True  |
>> trove@domain.com   |
>>
>> +----------------------------------+------------+---------+-----------------------+
>>
>> Have you checked the apache logs ? Is keystone-all running ? Is this the
>> first
>> boot, or a secondary boot ?
>>
>> Bruce
>>
>> > After booting openstack-image-controller, ran
>> > /etc/keystone/service-user-setup
>> >
>> > after that any keystone or openstack service commands giving below
>> > errors.
>> >
>> > root@controller:/etc/keystone# keystone user-list
>> > WARNING: Bypassing authentication using a token & endpoint
>> > (authentication
>> > credentials are being ignored).
>> > Unable to establish connection to
>> > http://controller:8081/keystone/admin/v2.0/users
>> >
>> > root@controller:/etc/keystone# keystone --debug user-list
>> > WARNING: Bypassing authentication using a token & endpoint
>> > (authentication
>> > credentials are being ignored).
>> > DEBUG:keystoneclient.session:REQ: curl -i -X GET
>> > http://controller:8081/keystone/admin/v2.0/users -H "User-Agent:
>> > python-keystoneclient" -H "X-Auth-Token:
>> > {SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
>> > INFO:requests.packages.urllib3.connectionpool:Starting new HTTP
>> > connection
>> > (1): controller
>> > Unable to establish connection to
>> > http://controller:8081/keystone/admin/v2.0/users
>> >
>> >
>> > my environment variables are
>> > root@controller:/etc/keystone# env
>> > TERM=xterm
>> > SHELL=/bin/sh
>> > SSH_CLIENT=192.168.7.220 54638 22
>> > SSH_TTY=/dev/pts/0
>> > USER=root
>> > MAIL=/var/mail/root
>> > PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
>> > PWD=/etc/keystone
>> > OS_PASSWORD=password
>> > EDITOR=/bin/vi
>> > TZ=UTC
>> > PS1=\u@\h:\w\$
>> > OS_AUTH_URL=http://controller:8081/keystone/main/v2.0/
>> > OS_USERNAME=admin
>> > SHLVL=1
>> > HOME=/home/root
>> > OS_TENANT_NAME=admin
>> > LOGNAME=root
>> > SSH_CONNECTION=192.168.7.220 54638 192.168.7.2 22
>> > SERVICE_ENDPOINT=http://controller:8081/keystone/admin/v2.0
>> > SERVICE_TOKEN=password
>> > _=/usr/bin/env
>> > OLDPWD=/home/root
>> >
>> >
>> > keystone.conf is
>> > # The port number which the public service listens on
>> > # public_port = 5000
>> >
>> > # The port number which the public admin listens on
>> > # admin_port = 35357
>> > admin_endpoint = http://192.168.7.2:8081/keystone/admin/
>> > public_endpoint = http://192.168.7.2:8081/keystone/main/
>> >
>> >
>> > I will be really thankful, if you could guide me.
>> >
>> > Thanks,
>> > Srinivas.
>> >
>> >
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

