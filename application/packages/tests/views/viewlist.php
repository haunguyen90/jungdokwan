<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div>TODO write content</div>
        <table>
            <tr>
                <td>Id</td>
                <td>title</td>
                <td>Firtname</td>
                <td>Middlename</td>
                <td>Lastname</td>
                <td>dob</td>
                <td>company</td>
                <td>date_created</td>
                <td>date_updated</td>
                <td>is_actived</td>
                <td>is_user_id</td>
                <td>user_id</td>
                <td>is_public</td>
                <td>profile_image_path</td>
                <td>type</td>
                <td>Visibility</td>
                <td>notes</td>
                
            </tr>
            <?php 
                foreach($contacts as $key=>$list){
                
             ?>
            <tr>
                <td><?php echo $list['id'] ?></td>
                <td><?php echo $list['title'] ?></td>
                <td><?php echo $list['first_name'] ?></td>
                <td><?php echo $list['middle_name'] ?></td>
                <td><?php echo $list['last_name'] ?></td>
                <td><?php echo $list['dob'] ?></td>
                <td><?php echo $list['company'] ?></td>
                <td><?php echo $list['date_created'] ?></td>
                <td><?php echo $list['date_updated'] ?></td>
                <td><?php echo $list['is_active'] ?></td>
                <td><?php echo $list['is_user_id'] ?></td>
                <td><?php echo $list['user_id'] ?></td>
                <td><?php echo $list['is_public'] ?></td>
                <td><?php echo $list['profile_image_path'] ?></td>
                <td><?php echo $list['notes'] ?></td>
                <td><?php echo $list['visibility'] ?></td>
                <td><?php echo $list['notes'] ?></td>
              
                
            </tr>
            <?php
                }
            ?>
        </table>
    </body>
</html>
