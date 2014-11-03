Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A777FE008EA; Mon,  3 Nov 2014 05:02:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F375E008BA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Nov 2014 05:02:16 -0800 (PST)
Received: by mail-la0-f52.google.com with SMTP id pv20so7479486lab.25
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Nov 2014 05:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eM8wwtPXh57PakXd6IlxKxc0ViNPD1bB8C+Vnrr9uiM=;
	b=eu40FGK27pR0OLgBnCVGJwpiS7JkxzdGQV3w5cSfuG7LrqV2feBSg1khOvHq1VcnoY
	IkcZ7ycyBexF3Au3XvgdD9rKEbGfe66Tc/rdXxBXl1SVtPSWp1xfQ0X8Y0kW4FfYnPeU
	Lhcuo2wJlRHZ6aPdUQROm/IONCbmVLESssh4Eoy51QLgATeknd/9zDp9omKSr10WemWB
	GCD4CqQPoBsWENAXDZy/qvS88osKykHZDTMwQyNMf+nfjukSy02f4dISC5BZmHaiH3eb
	VnyM6emG/lhPRug8cD/+tW2mBOePSoCdWvyIPZxKvGd++RqrnOi0gNrFCR436XerejFf
	Ul8g==
MIME-Version: 1.0
X-Received: by 10.152.216.167 with SMTP id or7mr12520745lac.93.1415019735501; 
	Mon, 03 Nov 2014 05:02:15 -0800 (PST)
Received: by 10.112.4.168 with HTTP; Mon, 3 Nov 2014 05:02:15 -0800 (PST)
In-Reply-To: <CADkTA4OYL+-U05BmzBXnj=j+NrBWku7ag777KgEPuUtJ_wU2HA@mail.gmail.com>
References: <1412714029-19190-1-git-send-email-zibo.zhao@windriver.com>
	<CADkTA4OYL+-U05BmzBXnj=j+NrBWku7ag777KgEPuUtJ_wU2HA@mail.gmail.com>
Date: Mon, 3 Nov 2014 08:02:15 -0500
Message-ID: <CADkTA4PdUHQ8KckHNQEOTH3v1weRRAu5Bz8Zgu0DaTmSTAZ-Ww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zibo Zhao <zibo.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] libvirtd not properly shutting down on oVirt node install
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
X-List-Received-Date: Mon, 03 Nov 2014 13:02:20 -0000
Content-Type: text/plain; charset=UTF-8

ping.

On Tue, Oct 7, 2014 at 11:37 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Oct 7, 2014 at 4:33 PM, Zibo Zhao <zibo.zhao@windriver.com> wrote:
>> From: Prateek Kumar <prateek.kumar@windriver.com>
>>
>> On registering the ovirt node form the ovirt engine web
>> interface the ovirt node installation goes fine but the
>> node will suffer a "communication failure" and the
>> status of the node will fail to go up status.
>> Its due to the race condition in libvirtd shutdown where
>> pid file is deleted before the real libvirtd process get
>> terminated.
>> The issue is fixed by making sure the libvirtd process
>> is terminated before deteting the pid file and providing
>
> "deleting"
>
>> sufficient delay.
>>
>
> What's the difference between the two patches that came out hours apart ?
> Also, can we make these lines closer to 72 chars long .. it makes the log easier
> to read.
>
> ... and finally, while that is a fine description of the problem, it
> is talking about
> packages that we don't have in meta-virt. So I'd like the log to just
> describe the
> race, and the fix, and drop the oVirt parts.
>
>> Signed-off-by: Prateek Kumar <prateek.kumar@windriver.com>
>> Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
>> ---
>>  recipes-extended/libvirt/libvirt/libvirtd.sh | 36 +++++++++++++++++++++-------
>>  1 file changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt/libvirtd.sh b/recipes-extended/libvirt/libvirt/libvirtd.sh
>> index b4fa674..beb77ec 100755
>> --- a/recipes-extended/libvirt/libvirt/libvirtd.sh
>> +++ b/recipes-extended/libvirt/libvirt/libvirtd.sh
>> @@ -9,6 +9,8 @@
>>
>>  . /etc/init.d/functions
>>
>> +PID=/var/run/libvirtd.pid
>> +
>>  if [ -f /lib/lsb/init-functions ]
>>  then
>>      . /lib/lsb/init-functions
>> @@ -72,24 +74,42 @@ fi
>>
>>  case "$1" in
>>          start)
>> -                if [ -e /var/run/libvirtd.pid ]; then
>> -                        if [ -d /proc/$(cat /var/run/libvirtd.pid) ]; then
>> +                if [ -e $PID ]; then
>> +                        if [ -d /proc/$(cat $PID) ]; then
>>                                  echo "virtualization library already started; not starting."
>>                          else
>> -                                echo "Removing stale PID file /var/run/libvirtd.pid."
>> -                                rm -f /var/run/libvirtd.pid
>> +                                echo "Removing stale PID file $PID."
>> +                                rm -f $PID
>
> The switch to using $PID really looks like it should be a separate patch. Since
> is has nothing to do with the race condition fix.
>
>>                          fi
>>                  fi
>>                  log_begin_msg "Starting virtualization library daemon: libvirtd"
>>                  start-stop-daemon -K -x /usr/bin/dnsmasq
>> -               start-stop-daemon --start --quiet --pidfile /var/run/libvirtd.pid --exec /usr/sbin/libvirtd -- --daemon --listen
>> +                start-stop-daemon --start --quiet --pidfile $PID --exec /usr/sbin/libvirtd -- --daemon --listen
>>                  log_end_msg $?
>>                  ;;
>>          stop)
>> +                if [ -f $PID ]; then
>> +                        libvirtd_pid=$(cat $PID)
>> +                fi
>>                  log_begin_msg "Stopping virtualization library daemon: libvirtd"
>> -               start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile /var/run/libvirtd.pid
>> -                log_end_msg $?
>> -                rm -f /var/run/libvirtd.pid
>> +                start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile $PID
>> +                CHECK=0
>> +                K=0
>> +                if [ "x$libvirtd_pid" != "x" ]; then
>> +                        while /bin/kill -0 $libvirtd_pid >/dev/null 2>&1; do
>
> we shouldn't hardcode /bin/kill.
>
> Bruce
>
>> +                               K=$(($K+1))
>> +                               sleep 1
>> +                               if [ $K -ge 60 ]; then
>> +                                       log_end_msg "Stopping libvirtd: timed out"
>> +                                       CHECK=1
>> +                                       break
>> +                               fi
>> +                        done
>> +                fi
>> +                if [ $CHECK -eq 0 ]; then
>> +                        log_end_msg "Removing pid file $PID"
>> +                        rm -f $PID
>> +                fi
>>                  ;;
>>          restart)
>>                  $0 stop
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

