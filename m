Return-Path: <alejandro.delcastillo@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C254E0097D; Wed, 13 May 2015 14:59:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38A1DE008DC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 14:59:35 -0700 (PDT)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4DLxXdk026901; Wed, 13 May 2015 16:59:33 -0500
Received: from [10.2.33.36] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015051316593395-1432992 ;
	Wed, 13 May 2015 16:59:33 -0500 
Message-ID: <5553C943.9050704@ni.com>
Date: Wed, 13 May 2015 16:59:31 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1431098920-13669-1-git-send-email-alejandro.delcastillo@ni.com>	<CADkTA4OeKO0ccSu24as0U5EkmAFJFMOnejbQbgbiu=5pOceRjg@mail.gmail.com>	<55521E7C.1060105@ni.com>
	<CADkTA4O5W=Yfrqihq2tkGL4fRULHZM2OG9AJSsgpASk4h=Bw_g@mail.gmail.com>
In-Reply-To: <CADkTA4O5W=Yfrqihq2tkGL4fRULHZM2OG9AJSsgpASk4h=Bw_g@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/13/2015 04:59:33 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/13/2015 04:59:34 PM,
	Serialize complete at 05/13/2015 04:59:34 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-13_07:, , signatures=0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, code@joelwhitehouse.com,
	Joseph Hall <perlhoser@gmail.com>
Subject: Re: [PATCH] salt: add recipe for salt
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
X-List-Received-Date: Wed, 13 May 2015 21:59:37 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8



On 05/12/2015 11:20 AM, Bruce Ashfield wrote:
> On Tue, May 12, 2015 at 11:38 AM, Alejandro del Castillo
> <alejandro.delcastillo@ni.com> wrote:
>>
>>
>> On 05/11/2015 11:08 PM, Bruce Ashfield wrote:
>>> The series looks good to me, I've queued it locally and will push it soon.
>>> Is there a README or HOWTO for any runtime testing ?
>>
>> There is a ton of documentation on SaltStack website
>> (http://docs.saltstack.com/en/latest/contents.html). The help is extensive,
>> which can make it overwhelming.
> 
> I find the same thing with all of openstack :)
> 
>>
>> The recipe has 6 components that provide different System Configuration
>> Management functionality. For embedded, I expect the majority of the use cases
>> will involve running only the salt-minion, but I did test all the components.
>> The components:
>>
>> salt-master (daemon).-
>> salt-minion (daemon)
>> salt-syndic (daemon)
>> salt-ssh
>> salt-api  (daemon)
>> salt-cloud
>>
>> If it helps, I can send you the testing that I did for each component.
> 
> 
> That would be great!

* salt-master & salt-minion : The salt minion is a daemon that receives command
from a salt-master

  - Install salt master, verify that service is running (It spawns several
salt-master processes)
  - Install salt-minion, verify that service is running (1 process)
  - Set salt-minion master setting to salt-master instance. On /etc/salt/minion set
	master: <DNS of your system>
   - Restart salt-minion
        /etc/init.d/salt-minion restart
   - Accept salt-minion key
        salt-key -A
   - Ping salt-minion from master
	salt '*' test.ping    (you should get a ping)

* salt-syndic : Special pass-through minion that runs on a master so it can
connect to another master

For this test you'll need another system running salt-master, which will be the
master of masters

    - Set the master of masters dns by adding to /etc/salt/master
         syndic_master: <master of masters dns>
    - Install salt-syndic and verify that the service is running (1 process)
    - On the master of master's server, accept the syndic key:
         salt-key -A
    - Ping all targets from master of masters
         salt '*' test.ping   (you should get a ping, comming from the minion,
via the syndic)

Cleanup:
      - Uninstall the syndic
      - killall salt-syndic (due to https://github.com/saltstack/salt/issues/23026)

* salt-ssh : Allow routines to be executed on remote systems entirely via ssh.

     - Install salt-ssh
     - Configure machine to connect to on /etc/salt/roster (doesn't need to have
salt installed)
           myslave:
              host: <slave_ip>
              user: <ssh_username>
              passwd: <ssh_passwd>
     - Ping slave
           salt-ssh myslave test.ping

* salt-api : Modular interface on top of Salt that can provide a variety of
entry points into a running salt system

      - Configure WSGI interface and auth via pam by adding to /etc/salt/master:
            rest_wsgi:
               port: 8001
            external_auth:
               pam:
                 <username>:
                    -.*
       - Install salt-api (it will spawn 2 processes)
       - Restart salt-master
            /etc/init.d/salt-master restart

        - Ping via the REST API
           curl -sS -i -H 'Content-Type: application/json' -d
'[{"eauth":"pam","username":"<username>","password":"<passwd>","client":"local","tgt":"*","fun":"test.ping"}]'
localhost:8001

CAVEATS
   - You can't use username root

* salt-cloud : Interface to public cloud VM management systems

        - Configure salt-cloud to use Amazon EC2 by adding to
/etc/salt/cloud.providers/myprovider.conf:
           myprovider:
              id: <AWS_ACCESS_KEY_ID>
              key: '<AWS_SECRET_ACCESS_KEY>'
              keyname: <aws_ssh_key>.pem
              private_key: <path_to_pem_file>
              provider: ec2
         - List configured providers:
	   salt-cloud --list-providers (should list ec2 as a provider)

To run --list-providers you don't need a EC2 account (just make up values). If
you want to interact with the cloud, you'll need a EC2 account, and you will
need to fill the values on myprovider.conf. Then you should be able to do things
like list the available images:
            salt-cloud --list-images ec2

-- 
Cheers,

Alejandro

