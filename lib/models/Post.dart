/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const PostType();
  final String id;
  final String title;
  final int date;
  final String body;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Post._internal(
      {@required this.id,
      @required this.title,
      @required this.date,
      @required this.body});

  factory Post(
      {@required String id,
      @required String title,
      @required int date,
      @required String body}) {
    return Post._internal(
        id: id == null ? UUID.getUUID() : id,
        title: title,
        date: date,
        body: body);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        title == other.title &&
        date == other.date &&
        body == other.body;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Post {");
    buffer.write("id=" + id + ", ");
    buffer.write("title=" + title + ", ");
    buffer.write("date=" + (date != null ? date.toString() : "null") + ", ");
    buffer.write("body=" + body);
    buffer.write("}");

    return buffer.toString();
  }

  Post copyWith(
      {@required String id,
      @required String title,
      @required int date,
      @required String body}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        body: body ?? this.body);
  }

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        date = json['date'],
        body = json['body'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'date': date, 'body': body};

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField BODY = QueryField(fieldName: "body");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.TITLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.DATE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.BODY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class PostType extends ModelType<Post> {
  const PostType();

  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}
